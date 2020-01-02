package main

import (
	"fmt"
	"io"
)

type Test struct {
	FieldOne   string
	FieldTwo   int
	fieldThree io.Reader
	io.Reader
}

func main() {
	fmt.Println("Just doin things")
}
