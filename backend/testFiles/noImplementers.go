package testFiles

type Test interface {
	DONOTIMPLEMENT() string
}

type TestStruct struct{}

func (t TestStruct) DoThing() string {
	return "Thing done"
}
