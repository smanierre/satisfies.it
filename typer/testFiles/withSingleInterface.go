package main

import (
	"fmt"
	"io"
)

type Test interface {
	SigOne(a io.Reader)
	SigTwo() int
	SigThree(a string) bool
}

func main() {
	fmt.Println("testing, testing, 123")
}
