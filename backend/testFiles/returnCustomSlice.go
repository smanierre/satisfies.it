package test

import "io"

type ReturnCustomSlice interface {
	MethodOne() []io.Writer
}
