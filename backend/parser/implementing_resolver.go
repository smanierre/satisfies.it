package parser

import (
	"fmt"
	"reflect"
)

//ResolveImplementations should only be called once after all of the files that need to be parsed have been parsed.
//Empty interfaces will not have types resolved to them and types will not show if they implement an empty interface,
//as the amount of them would just make every type get bloated with empty interfaces and every empty interface bloated with every type.
func (p *Parser) ResolveImplementations() {
	//Resolve the interfaces implemented by each type.
	interfaces := []CustomType{}
	concreteTypes := []CustomType{}
	for _, t := range p.Types {
		if t.Type == Interface {
			//Add the interface to the interfaces slice for later use, then continue.
			interfaces = append(interfaces, t)
			continue
		}
		//Not an interface so append it to the concreteTypes slice.
		concreteTypes = append(concreteTypes, t)
	}

	for _, t := range concreteTypes {
		for _, i := range interfaces {
			//Check if the type (t) implements the interface (i)
			//TODO: Despite people not being supposed to mix pointer and non-pointer receivers on a single type, they probably do.
			//so at it sits now, this will still consider that as implementing an interface, which it should not.
			if implements, pointer := implements(i.Methods, t.Methods); implements {
				var interfaceName, typeName string
				if pointer {
					interfaceName = fmt.Sprintf("%s.%s", i.Package, i.Name)
					typeName = fmt.Sprintf("*%s.%s", t.Package, t.Name)
				} else {
					interfaceName = fmt.Sprintf("%s.%s", i.Package, i.Name)
					typeName = fmt.Sprintf("%s.%s", t.Package, t.Name)
				}
				p.InterfaceImplementers[interfaceName] = append(p.InterfaceImplementers[interfaceName], t)
				p.TypeImplementees[typeName] = append(p.TypeImplementees[typeName], i)
			}
		}
	}
}

func implements(beingImplemented, implementing []Method) (implements bool, pointer bool) {
	if len(beingImplemented) == 0 {
		//If the interface is empty, don't add it since there are so many and it doesn't really provide any meaningful information.
		return false, false
	}
	pointerImplementer := true
	for _, method := range beingImplemented {
		match := false
		for _, implementingMethod := range implementing {
			if methodsMatch(method, implementingMethod) {
				match = true
				if implementingMethod.PointerReceiver == false {
					pointerImplementer = false
				}
				break
			}
		}
		if !match {
			return false, false
		}
	}
	//If pointerImplementer is still true, all implementing methods are pointer methods
	//so implementing type should be a pointer.
	if pointerImplementer {
		return true, true
	}
	return true, false
}

func methodsMatch(a, b Method) bool {
	return a.Name == b.Name && reflect.DeepEqual(a.Parameters, b.Parameters) && reflect.DeepEqual(a.ReturnValues, b.ReturnValues)
}
