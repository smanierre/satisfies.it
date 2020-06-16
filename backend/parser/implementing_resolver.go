package parser

func (p *Parser) resolveImplementations() {
	//Resolve the interfaces implemented by each type.
	for _, t := range p.Types {
		if t.Type == Interface {
			//We don't care about interfaces right now, skip.
			continue
		}

	}
}
