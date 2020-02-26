package test

import "io"

type CustomMap interface {
	MethodOne(map[io.Writer]io.Writer)
}
