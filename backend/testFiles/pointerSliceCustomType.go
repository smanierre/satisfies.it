package test

import "io"

type PointerSliceCustomType interface {
	MethodOne(*[]io.Writer)
}
