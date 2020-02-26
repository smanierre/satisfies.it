package test

import "io"

type TwoDCustomTypeSlice interface {
	MethodOne([][]io.Writer)
}
