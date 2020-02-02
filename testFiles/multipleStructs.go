package test

import "io"

type StructOne struct {
}

type StructTwo struct {
	io.Writer
}
