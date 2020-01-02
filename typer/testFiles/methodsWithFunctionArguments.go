package test

import (
	"fmt"
	"io"
)

type TestType int

func (t *TestType) MethodOne(f func(int, *io.Writer), d int) {

}

func (t TestType) MethodTwo(a func() (int, *io.Writer), b func(string, string, string) bool) func(int, string)

func main() {
	fmt.Println("Functions? More like  fun-to-write-regexes-for-ctions. amirite?")
}
