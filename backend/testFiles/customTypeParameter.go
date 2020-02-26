package test

import "io"

type CustomTypeParameter interface {
	MethodOne(io.Writer)
}
