package testFiles

type InterfaceThree interface {
	MethodOne()
	MethodTwo([]string) struct{}
}

type RegularImplementerOne struct{}

func (r RegularImplementerOne) MethodOne() {}
func (r RegularImplementerOne) MethodTwo([]string) struct{} {
	return struct{}{}
}

type PointerImplementerOne int

func (p *PointerImplementerOne) MethodOne() {}
func (p *PointerImplementerOne) MethodTwo([]string) struct{} {
	return struct{}{}
}
