package parser

import "fmt"

func (p *Parser) resolveMethods() {
	for _, m := range p.Methods {
		if m.Receiver == "" {
			//This is an interface method, ignore it.
			continue
		}
		if m.PointerReceiver {
			m.Receiver = m.Receiver[1:]
		}
		for _, t := range p.Types {
			if m.Receiver == fmt.Sprintf("%s.%s", t.Package, t.Name) {
				fmt.Printf("Method: %s matched to Type: %s.%s\n", m.Name, t.Package, t.Name)
			}
		}
	}
}

//TODO: REMOVE PACKAGE FIELD FROM METHOD AND UPDATE ALL FILES
