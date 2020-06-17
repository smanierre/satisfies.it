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
			if implements(i.Methods, t.Methods) {
				interfaceName := fmt.Sprintf("%s.%s", i.Package, i.Name)
				typeName := fmt.Sprintf("%s.%s", t.Package, t.Name)
				p.InterfaceImplementers[interfaceName] = append(p.InterfaceImplementers[interfaceName], t)
				p.TypeImplementees[typeName] = append(p.TypeImplementees[typeName], i)
			}
		}
	}
}

func implements(beingImplemented, implementing []Method) bool {
	if len(beingImplemented) == 0 {
		//If the interface is empty, don't add it since there are so many and it doesn't really provide any meaningful information.
		return false
	}
	for _, method := range beingImplemented {
		match := false
		for _, implementingMethod := range implementing {
			if methodsMatch(method, implementingMethod) {
				match = true
				break
			}
		}
		if !match {
			return false
		}
	}
	return true
}

func methodsMatch(a, b Method) bool {
	return a.Name == b.Name && reflect.DeepEqual(a.Parameters, b.Parameters) && reflect.DeepEqual(a.ReturnValues, b.ReturnValues)
}
