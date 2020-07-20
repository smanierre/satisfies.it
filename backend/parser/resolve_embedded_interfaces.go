package parser

import (
	"fmt"
	"strings"
)

func (p *Parser) resolveEmbeddedInterfaces() {
	for i, t := range p.Types {
		for j, method := range t.Methods {
			//If the name contains a ., it's an embedded interface. Search for if it's been parsed and update
			if strings.Contains(method.Name, ".") {
				for _, ty := range p.Types {
					if fmt.Sprintf("%s.%s", ty.Package, ty.Name) == method.Name {
						//This is the interface being embedded, copy the methods to the original interface.
						//Get rid of the embedded interface first, then append methods of that interface.
						p.Types[i].Methods = append(p.Types[i].Methods[:j], p.Types[i].Methods[j+1:]...)
						p.Types[i].Methods = append(p.Types[i].Methods, ty.Methods...)
					}
				}
			}
		}
	}
}
