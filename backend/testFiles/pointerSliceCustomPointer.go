package test

import "io"

type PointerSliceCustomPointer interface {
	MethodOne(*[]*io.Writer)
}
