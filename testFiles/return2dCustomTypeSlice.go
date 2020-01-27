package test

import "io"

type ReturnTwoDCustomTypeSlice interface {
	MethodOne() [][]io.Writer
}
