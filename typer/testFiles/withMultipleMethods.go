package test

import (
	"fmt"
	"io"
)

type S struct {
	FieldOne string
	io.Reader
	FieldThree int
}

func (s *S) MethodOne(a, b, c string) *int {
	num := 4
	return &num
}

func (s *S) MethodTwo() {

}

func (s *S) methodThree() {}

type Custom bool

func (c Custom) doThing(n float64) *S {
	return &S{}
}

func (c Custom) SomethingElse() (bool, error, interface{}) {
	return false, nil
}

func main() {
	fmt.Println("I'm running out of things to write in these.")
}
