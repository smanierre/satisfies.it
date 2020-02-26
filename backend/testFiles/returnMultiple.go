package test

import "io"

type ReturnMultiple interface {
	MethodOne() ([][]*int, int, io.Writer, interface{}, *int)
}
