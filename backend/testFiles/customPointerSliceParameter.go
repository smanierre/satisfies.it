package test

import "io"

type CustomPointerSliceParameter interface {
	MethodOne([]*io.Writer)
}
