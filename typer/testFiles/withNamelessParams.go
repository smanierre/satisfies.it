package test

import (
	"fmt"
	"io"
)

type Custom struct{}

func (Custom) MethodOne(io.Writer, int, *string) (io.Writer, error) {
	return io.Writer{}, nil
}
