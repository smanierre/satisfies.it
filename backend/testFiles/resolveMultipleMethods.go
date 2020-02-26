package test

type TypeOne int

func (t TypeOne) MethodOne(s string, i *int) {}
func (t TypeOne) MethodTwo() (int, error)    {}

type TypeTwo struct{}

func (t TypeTwo) MethodTwoOne() {}
func (t *TypeTwo) MethodTwoTwo(s []string, m map[string]int) int
