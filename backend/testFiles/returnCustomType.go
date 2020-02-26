package test

import "io"

type ReturnCustomType interface {
	MethodOne() io.Writer
}
