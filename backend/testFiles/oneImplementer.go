package testFiles

type InterfaceOne interface {
	MethodOne() error
}

type ImplementerOne struct{}

func (i ImplementerOne) MethodOne() error {
	return nil
}
