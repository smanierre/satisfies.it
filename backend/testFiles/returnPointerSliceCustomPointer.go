package test

import "io"

type ReturnPointerSliceCustomPointer interface {
	MethodOne() *[]*io.Writer
}
