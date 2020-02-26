package test

import "io"

type TypeOne map[string]func(int) (error, *io.Writer)
type TypeTwo *io.ReadWriter
type TypeThree func(interface{})
