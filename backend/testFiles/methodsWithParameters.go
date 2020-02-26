package test

import "io"

type TypeOne struct{}

func (t TypeOne) MethodOne(i int, w io.Writer)
