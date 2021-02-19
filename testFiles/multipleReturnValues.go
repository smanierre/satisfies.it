package testFiles

type TestType interface {
	MethodOne() (a, b int, e error)
}

type TestConcrete struct{}

func (t TestConcrete) MethodTwo() (a int, e, c error) {
	return 0, nil, nil
}
