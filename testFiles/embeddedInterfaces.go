package test

import "io"

type WithEmbedded interface {
	io.Reader
	io.Writer
}
