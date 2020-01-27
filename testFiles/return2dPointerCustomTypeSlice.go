package test

import "io"

type ReturnTwoDPointerCustomTypeSlice interface {
	MethodOne() [][]*io.Writer
}
