package typer

import (
	"fmt"
	"io"
	"io/ioutil"
	"regexp"
	"strings"
)

// Typer can parse go files to extract the types from the file and extract all the information about each type including fields, methods, and signatures.
type Typer struct {
	interfaces    []Interface
	concreteTypes []ConcreteType
	methods       []Method
}

// Interface holds the information about an interface including what methods it requires.
type Interface struct {
	Package  string   `json:"Package"`
	Name     string   `json:"Name"`
	BaseType string   `json:"BaseType"`
	Methods  []Method `json:"Methods"`
}

// ConcreteType represents a defined type with methods on it, regardless of the base type.
type ConcreteType struct {
	Package  string            `json:"Package"`
	Name     string            `json:"Name"`
	BaseType string            `json:"BaseType"`
	Fields   map[string]string `json:"Fields"`
	Methods  []Method          `json:"Methods"`
}

// Method is a type to hold all the information needed to associate a method with a type
type Method struct {
	Package      string   `json:"Package"`
	Receiver     string   `json:"Receiver"`
	Name         string   `json:"Name"`
	Parameters   []string `json:"Parameters"`
	ReturnValues []string `json:"ReturnValues"`
}

// NewTyper returns an already initialized Typer, ready to parse files.
func NewTyper() *Typer {
	return &Typer{
		[]Interface{},
		[]ConcreteType{},
		[]Method{},
	}
}

// Parse reads the given io.Reader and parses the interfaces within
func (t *Typer) Parse(source io.Reader) error {

	fileContents, err := ioutil.ReadAll(source)
	if err != nil {
		return fmt.Errorf("unable to read from source %v", err)
	}

	packageNameRegex := regexp.MustCompile(`package ([a-zA-Z_0-9]+)\s`)
	result := packageNameRegex.FindSubmatch(fileContents)
	if result == nil {
		return fmt.Errorf("unable to parse file, no package name")
	}
	packageName := strings.TrimSpace(string(result[1]))

	types := parseTypes(packageName, fileContents)
	if len(types) != 0 {
		for _, ty := range types {
			switch ty.(type) {
			case Interface:
				t.interfaces = append(t.interfaces, ty.(Interface))
			case ConcreteType:
				t.concreteTypes = append(t.concreteTypes, ty.(ConcreteType))
			}
		}
	}

	methods := parseMethods(packageName, fileContents)
	if len(methods) != 0 {
		t.methods = append(t.methods, methods...)
	}
	return nil
}

func parseTypes(p string, source []byte) []interface{} {

	types := []interface{}{}
	var currentInterface Interface
	var currentConcreteType ConcreteType

	typeRegex := regexp.MustCompile(`type ([A-Z][a-zA-Z0-9_]*) ([a-zA-Z0-9_]+)\s?{?([a-zA-Z0-9\(\)\s_\.\[\]\,\*]*)?}?`)
	results := typeRegex.FindAllSubmatch(source, -1)

	for _, t := range results {
		if string(t[2]) == "interface" {
			currentInterface = Interface{}
			currentInterface.Package = p
			currentInterface.Name = string(t[1])
			currentInterface.BaseType = string(t[2])
			currentInterface.Methods = parseInterfaceMethods(p, t[3])
			types = append(types, currentInterface)
		}
		if string(t[2]) == "struct" {
			currentConcreteType = ConcreteType{}
			currentConcreteType.Package = p
			currentConcreteType.Name = string(t[1])
			currentConcreteType.BaseType = string(t[2])
			fields := parseFields(t)
			currentConcreteType.Fields = fields
			currentConcreteType.Methods = []Method{}
			types = append(types, currentConcreteType)
		}
	}

	// Need to parse the custom types separately since I couldn't get them to work with the regex used for structs and interfaces
	customTypeRegex := regexp.MustCompile(`type\s+([A-Z][a-zA-Z0-9_]*)\s+([a-zA-Z0-9_\(\)\{\}\t\f ,]+)\n`)
	results = customTypeRegex.FindAllSubmatch(source, -1)
	for _, ct := range results {
		// New custom type regex that detects functions also picks up structs and interfaces, so skip those.
		if strings.Contains(string(ct[2]), "interface") || strings.Contains(string(ct[2]), "struct") {
			continue
		}
		currentConcreteType = ConcreteType{}
		currentConcreteType.Package = p
		currentConcreteType.Name = string(ct[1])
		currentConcreteType.BaseType = string(ct[2])
		currentConcreteType.Fields = map[string]string{}
		currentConcreteType.Methods = []Method{}
		types = append(types, currentConcreteType)
	}
	return types
}

func parseInterfaceMethods(p string, methods []byte) []Method {
	methods = []byte(strings.TrimSpace(string(methods)))
	var toReturn []Method
	interfaceMethodRegex := regexp.MustCompile(`([a-zA-z0-9_]+) *\(([a-zA-Z0-9\*\. {},]*)\) *\(?([a-zA-Z0-9\*\. {},]*)\)?`)
	results := interfaceMethodRegex.FindAllSubmatch(methods, -1)
	for _, method := range results {
		m := Method{}
		m.Package = p
		m.Receiver = ""
		m.Name = strings.TrimSpace(string(method[1]))
		m.Parameters = parseParameters(method[2])
		m.ReturnValues = parseReturnValues(method[3])
		toReturn = append(toReturn, m)
	}
	return toReturn
}

func parseFields(t [][]byte) map[string]string {
	fieldsToReturn := map[string]string{}
	fields := strings.Split(string(t[3]), "\n")
	fieldRegex := regexp.MustCompile(`([a-zA-Z0-9_\.\*]+)[\t ]*([a-zA-Z0-9_\*\[\]\.]+)?`)
	for _, field := range fields {
		results := fieldRegex.FindAllSubmatch([]byte(field), -1)
		if len(results) != 0 {
			// If the field doesn't start with a capital or a *, and doesn't contain a "." (indicates embedded type) skip parsing as it is un-exported
			if !(int(results[0][0][0]) >= 65 && int(results[0][0][0]) <= 90) && int(results[0][0][0]) != 42 && !strings.Contains(string(results[0][1]), ".") {
				continue
			}
			if len(results[0][2]) == 0 {
				fieldsToReturn[string(results[0][1])] = "embedded"
			} else {
				fieldsToReturn[string(results[0][1])] = string(results[0][2])
			}
		}
	}
	return fieldsToReturn
}

func parseMethods(p string, source []byte) []Method {
	methodRegex := regexp.MustCompile(`func \(([a-zA-Z0-9_*\s]+)\)\s*([A-Z][a-zA-Z0-9_]*)(.*)\s*{`)
	methodResults := methodRegex.FindAllSubmatch(source, -1)
	methods := []Method{}
	for _, method := range methodResults {
		m := Method{}
		m.Package = p
		receiver := strings.Split(string(method[1]), " ")
		if len(receiver) == 1 {
			pointerIndex := strings.Index(receiver[0], "*")
			if pointerIndex == -1 {
				m.Receiver = receiver[0]
			} else {
				m.Receiver = receiver[0][pointerIndex:]
			}
		} else {
			pointerIndex := strings.Index(receiver[1], "*")
			if pointerIndex == -1 {
				m.Receiver = receiver[1]
			} else {
				m.Receiver = receiver[1][pointerIndex:]
			}
		}
		m.Name = string(method[2])
		signatureMap := parseMethodSignature(strings.TrimSpace(string(method[3])))
		m.Parameters = signatureMap["parameters"]
		m.ReturnValues = signatureMap["returnValues"]
		methods = append(methods, m)
	}
	return methods
}

// Takes the method signature and returns a map with the keys "paramaters" and "returnValues". If there are none, the key will return an empty slice.
func parseMethodSignature(sig string) map[string][]string {
	returnMap := map[string][]string{}
	chars := strings.Split(sig, "")
	openParentheses := 0
	curString := ""
	paramsDone := false // Params will be done when the first full set of parentheses has been handled
	for _, v := range chars {
		if v == "(" {
			openParentheses++
			curString += v
		} else if v == ")" {
			curString += v
			openParentheses--
			if openParentheses == 0 && !paramsDone { // This is the close of the parameter parentheses
				returnMap["parameters"] = parseParameters([]byte(curString))
				paramsDone = true
				curString = ""
			}
			if openParentheses == 0 && paramsDone {
				returnMap["returnValues"] = parseReturnValues([]byte(curString))
			}
		} else {
			curString += v
		}
	}
	fmt.Println(sig)
	fmt.Println(returnMap)
	return returnMap
}

// TODO: Update to work with functions being passed in as parameters to a method.
func parseParameters(b []byte) []string {
	params := strings.Split(string(b), ",")
	if strings.Contains("func", string(b)) {
		parsedFunctionalParams := []string{}
		param := ""
		function := false
		openParens := 0
		for _, v := range params {
			if strings.Contains("func", v) {
				function = true
				param += v
				openParens++
			}
			if function { //Finish this. While function and parens are > 0, keep appending to the functional component. If not function, just append parameters then params to end array.
			}
		}
	}
	if params[0] == "()" {
		return []string{}
	}

	// Check to see if they are nameless parameters. If so, parse them.
	namelessParams := parseNamelessParams(params)
	if namelessParams != nil {
		return namelessParams
	}

	typelessParams := 0
	p := []string{}
	for _, param := range params {
		words := strings.Split(strings.TrimSpace(param), " ")
		if len(words) == 1 {
			typelessParams++
			continue
		}
		if typelessParams != 0 {
			for i := 0; i < typelessParams+1; i++ {
				p = append(p, strings.Split(words[1], ")")[0]) // splitting on the ) is the easiest way to shave off the ) if it's the last param
			}
			typelessParams = 0
			continue
		}
		p = append(p, strings.Split(words[1], ")")[0])
	}
	return p
}

// TODO: Update to work with functions being returned from methods. Also to work with named return values.
func parseNamelessParams(params []string) []string {
	empty := true
	for _, s := range params {
		if len(s) != 0 {
			empty = false
		}
	}
	if empty {
		return nil
	}
	nameless := true
	for _, param := range params {
		words := strings.Split(strings.TrimSpace(param), " ")
		if len(words) != 1 {
			nameless = false
		}
	}
	if !nameless {
		return nil
	}

	var p []string
	for i, param := range params {
		if i == 0 {
			p = append(p, strings.TrimSpace(param[1:]))
			continue
		}
		if i == len(params)-1 {
			p = append(p, strings.TrimSpace(param[:len(param)-1]))
			continue
		}
		p = append(p, strings.TrimSpace(param))
	}
	return p
}

func parseReturnValues(b []byte) []string {
	rv := []string{}
	if len(b) == 0 { // No return values
		return rv
	}
	if string(b[0]) == "(" { // Returns multiple values
		values := strings.Split(string(b), ",")
		for _, value := range values {
			words := strings.Split(strings.TrimSpace(value), " ")
			if len(words) == 2 {
				rv = append(rv, strings.Split(words[1], ")")[0])
				continue
			}
			// Remove ( from un-named first value
			if words[0][0] == '(' {
				rv = append(rv, words[0][1:])
				continue
			}
			// Remove ) from un-named last value
			if words[0][len(words[0])-1:] == ")" {
				rv = append(rv, words[0][:len(words[0])-1])
				continue
			}
			rv = append(rv, words[0])
		}
		return rv
	}
	rv = append(rv, strings.TrimSpace(string(b)))
	return rv
}

// ResolveMethods takes the methods that have already been parsed and associate them with their respective receivers
func (t *Typer) ResolveMethods() {
	typelessMethods := t.methods[:0]
	for i, method := range t.methods {
		// Ignore any methods attached to unexported fields.
		if method.Receiver[0] != '*' && (byte(method.Receiver[0]) > 96 && byte(method.Receiver[0]) < 123) {
			continue
		}
		match := false
		receiver := method.Receiver
		if receiver[0] == byte('*') {
			receiver = receiver[1:]
		}
		for j, s := range t.concreteTypes {
			if s.Package == method.Package && s.Name == receiver {
				t.concreteTypes[j].Methods = append(t.concreteTypes[j].Methods, method)
				match = true
			}
		}
		if !match {
			typelessMethods = append(typelessMethods, t.methods[i])
		}
	}
	t.methods = typelessMethods
}

// GetInterfaces returns the Interfaces that Typer has parsed so far
func (t *Typer) GetInterfaces() []Interface {
	return t.interfaces
}

// GetMethods returns the Methods that Typer has parsed so far
func (t *Typer) GetMethods() []Method {
	return t.methods
}

// GetConcreteTypes returns the ConcreteTypes that Typer has parsed so far
func (t *Typer) GetConcreteTypes() []ConcreteType {
	return t.concreteTypes
}
