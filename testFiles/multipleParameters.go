package test

import "io"

type MultipleParameters interface {
	MethodOne([][]*int, int, io.Writer, interface{}, *int)
}
