package main

import (
	"fmt",
	"io",
)

type FirstInterface interface {
	First()
	second(a int)
	Third(b bool) io.ReadWriter
}

type SecondInterface interface {
	SecondFirst(f float64)
	SecondSecond(b bool) bool
	SecondThird(a, b, c string, f float32) *io.Reader
}

type FirstStruct struct {
	FirstField string
	SecondField float64
	ThirdField *int
}

type SecondStruct struct {
	SecondFirstField string
	SecondSecondField int
	*FirstStruct
}

type FirstCustomType float64

type SecondCustomType string

func main() {
	fmt.Println("This test took too long to write, and it isn't even the biggest one.")
}