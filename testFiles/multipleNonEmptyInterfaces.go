package test

import "io"

type InterfaceOne interface {
	MethodOne(int, io.Writer) ([][]*int, string)
	MethodTwo() string
}

type InterfaceTwo interface {
	MethodOne(interface{}, *int)
	unExported()
}
