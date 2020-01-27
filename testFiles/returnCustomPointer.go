package test

import "io"

type ReturnCustomPointer interface {
	MethodOne() *io.Writer
}
