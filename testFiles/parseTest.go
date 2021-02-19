package testFiles

import "io"

type Interface interface {
	MethodOne(string, *io.Writer)
	MethodTwo() int
	MethodThree(string, string) (*interface{}, error)
}

type ConcreteType struct {
	fieldOne int
	fieldTwo Interface
}

type ConcreteCustom int

func (c ConcreteType) MethodOne(a string, i *io.Writer) {}

func (c ConcreteType) MethodTwo() int {
	return -1
}

func (c ConcreteType) MethodThree(a, b string) (*interface{}, error) {
	return nil, nil
}

func (c *ConcreteCustom) MethodOne(a string, i *io.Writer) {}

func (c *ConcreteCustom) MethodTwo() int {
	return -1
}

func (c *ConcreteCustom) MethodThree(a string, b string) (*interface{}, error) {
	return nil, nil
}
