package parser

import (
	"go/types"
	"log"
	"os"
	"path/filepath"
	"strings"
	"sync"

	"gitlab.com/sean.manierre/typer-site/util"
	"golang.org/x/tools/go/packages"
)

//This revamped parser is HEAVILY inspired by the following gist. https://gist.github.com/chewxy/2d286df6f2ac8910f69e7df9257b3944

//Parser is able to parse directories of .go files and extract all the type data. It holds all the custom types and what type implements
//what interface and vice versa.
type Parser struct {
	ConcreteTypes []types.Type
	Interfaces    []types.Type
	Implementers  map[types.Type][]types.Type //Key is interface, value is slice of types that implement it.
	Implementees  map[types.Type][]types.Type //Key is type, value is slice of interfaces it implements.
}

//New returns an initialized parser that is ready to parse files.
func New() *Parser {
	return &Parser{
		ConcreteTypes: []types.Type{},
		Interfaces:    []types.Type{},
		Implementers:  map[types.Type][]types.Type{},
		Implementees:  map[types.Type][]types.Type{},
	}
}

//ParseDir takes in a directory as a string and parses all the .go files within the directory.
//This ignores any files within a directory named `internal`. This also does not include any
//interfaces as it is not too hard to figure out what types implement those and it would just bloat everything.
func (p *Parser) ParseDir(dir string) error {
	pkgs := make(map[string]*packages.Package)
	var mut sync.Mutex
	var dirs []string
	walk := func(p string, info os.FileInfo, err error) error {
		if err != nil {
			return err
		}
		if strings.Contains(p, "/internal/") {
			return nil
		}
		if info.IsDir() {
			goFiles, err := filepath.Glob("*.go")
			if err != nil {
				log.Printf("error while getting list of go files: %s\n", err.Error())
			}
			if len(goFiles) > 0 {
				mut.Lock()
				dirs = append(dirs, p)
				mut.Unlock()
			}
		}
		return nil
	}
	err := filepath.Walk(dir, walk)
	if err != nil {
		return err
	}
	//DELETE FROM HERE
	log.Println("Parsing following dirs: ", dirs)
	//TO HERE
	cfg := &packages.Config{Mode: packages.NeedTypes | packages.NeedSyntax | packages.NeedTypesInfo, Tests: false, Dir: dir}
	ps, err := packages.Load(cfg, dirs...)
	if err != nil {
		return err
	}
	for _, pkg := range ps {
		pkgs[pkg.ID] = pkg
	}

	p.separateTypes(pkgs)

	discoveredPointers := map[string]types.Type{}
	for _, i := range p.Interfaces {
		iface, ok := i.Underlying().(*types.Interface)
		if !ok {
			log.Printf("error when casting %s to *types.Interface, skipping type.\n", i)
			continue
		}
		iface.Complete()
		if iface.Empty() {
			log.Printf("skipping empty interface %s.%s\n", i.(*types.Named).Obj().Pkg().Name(), i.(*types.Named).Obj().Name())
			continue
		}
		for _, t := range p.ConcreteTypes {
			implements := false
			//Check to see if the regular type implements the interface.
			if types.Implements(t, iface) {
				implements = true
				//Add the type to the list of implementers for the interface.
				if _, ok := p.Implementers[i]; ok {
					p.Implementers[i] = append(p.Implementers[i], t)
				} else {
					p.Implementers[i] = []types.Type{t}
				}
				//Add the interface to the list of implemented interfaces
				if _, ok := p.Implementees[t]; ok {
					p.Implementees[t] = append(p.Implementees[t], i)
				} else {
					p.Implementees[t] = []types.Type{i}
				}
			}
			//Check to see if there are any pointer receivers, if so, check to see if the pointer type implements the interface.
			//If the non-pointer type already implements the interface, the pointer type automatically does as well so don't check.
			if n, ok := t.(*types.Named); ok && !implements {
				pointerReceivers := false
				var pointer types.Type
				for i := 0; i < n.NumMethods(); i++ {
					sig, ok := n.Method(i).Type().(*types.Signature)
					if !ok {
						log.Printf("error when casting %s to *types.Signature, skipping\n", n.Method(i))
						continue
					}
					if _, ok := sig.Recv().Type().(*types.Pointer); ok {
						pointerReceivers = true
						pointer = sig.Recv().Type()
						break
					}
				}
				//TODO: find out why pointer types aren't being added as implementers in the database.
				if pointerReceivers {
					if types.Implements(pointer, iface) {
						//Add discovered pointer type to the map of discovered types if it is not already in there
						if _, ok := discoveredPointers[pointer.String()]; !ok {
							discoveredPointers[pointer.String()] = pointer
						}
						if _, ok := p.Implementers[i]; ok {
							p.Implementers[i] = append(p.Implementers[i], pointer)
						} else {
							p.Implementers[i] = []types.Type{pointer}
						}
						if _, ok := p.Implementees[pointer]; ok {
							p.Implementees[pointer] = append(p.Implementees[pointer], i)
						} else {
							p.Implementees[pointer] = []types.Type{i}
						}
					}
				}
			}
		}
	}
	//Add in all the discovered pointer types that are needed into the list of concrete types.
	for _, pointer := range discoveredPointers {
		p.ConcreteTypes = append(p.ConcreteTypes, pointer)
	}

	return nil
}

func (p *Parser) separateTypes(pkgs map[string]*packages.Package) {
	for _, info := range pkgs {
		if info.TypesInfo == nil {
			continue
		}
		for _, def := range info.TypesInfo.Defs {
			//Ignore any types that are lowercase as they are unexported.
			if def, ok := def.(*types.TypeName); ok && !def.IsAlias() && util.StartsWithUppercase(def.Name()) {
				if named, ok := def.Type().(*types.Named); ok {
					if !types.IsInterface(named.Underlying()) {
						p.ConcreteTypes = append(p.ConcreteTypes, named)
					} else {
						p.Interfaces = append(p.Interfaces, named)
					}
				}
			}
		}
	}
}
