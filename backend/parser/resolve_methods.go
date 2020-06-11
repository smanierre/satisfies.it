package parser

import (
	"fmt"
)

func (p *Parser) resolveMethods() {
	var remaining []Method
	for j, m := range p.Methods {
		//Keep track of whether or not the method has been resolved to a CustomType
		resolved := false
		if m.Receiver == "" {
			//This is an interface method, ignore it.
			continue
		}
		if m.PointerReceiver {
			//If the receiver is a pointer, take the * off the front so it matched the Type name. Modifying m doesn't matter since it's
			//a copy and we are getting the untouched method with p.Methods[j]
			m.Receiver = m.Receiver[1:]
		}

		for i, t := range p.Types {
			if m.Receiver == fmt.Sprintf("%s.%s", t.Package, t.Name) {
				//If the method belongs to a CustomType add it to the type and mark it as resolved.
				p.Types[i].Methods = append(p.Types[i].Methods, p.Methods[j])
				resolved = true
				break
			}
		}
		if !resolved {
			//If the method was not resolved to a CustomType, then add it to the remaining slice
			remaining = append(remaining, p.Methods[j])
		}
	}
	//Set p.Methods to the remaining slice which represents any methods that haven't been resolved to a CustomType
	p.Methods = remaining
}

func removeMethod(methods []Method, i int) []Method {
	copy(methods[i:], methods[i+1:])
	methods = methods[:len(methods)-1]
	return methods
}
