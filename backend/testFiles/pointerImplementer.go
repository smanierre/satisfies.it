package testFiles

type InterfaceTwo interface {
	MethodOne(int, interface{}) (int, error)
}

type PointerImplementer struct{}

func (p *PointerImplementer) MethodOne(i int, in interface{}) (int, error) {
	return -1, nil
}
