package test

import "io"


type CustomSliceParameter interface {
	MethodOne([]io.Writer)

}