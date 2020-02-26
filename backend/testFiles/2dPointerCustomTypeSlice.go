package test

import "io"

type TwoDPointerCustomTypeSlice interface {
	MethodOne([][]*io.Writer)
}
