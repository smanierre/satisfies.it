package test

import "io"

type ReturnPointerSliceCustomType interface {
	MethodOne() *[]io.Writer
}
