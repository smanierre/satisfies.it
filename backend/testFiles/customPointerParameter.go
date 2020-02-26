package test

import "io"

type CustomPointerParameter interface {
	MethodOne(*io.Writer, int)
}
