package test

type unexported struct{}

func (u unexported) Exported()
