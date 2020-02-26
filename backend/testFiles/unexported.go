package test

type Unexported interface {
	unexportedFuncOne(int) error
	unexportedFuncTwo(int) error
}
