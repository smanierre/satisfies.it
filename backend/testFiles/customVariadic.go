package test

import "io"

type CustomVariadic interface {
	MethodOne(...io.Writer)
}
