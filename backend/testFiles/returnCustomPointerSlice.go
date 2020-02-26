package test

import "io"

type ReturnCustomPointerSlice interface {
	MethodOne() []*io.Writer
}
