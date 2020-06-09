package testFiles

import "io"

type ParamlessReceiver func()

func (pr ParamlessReceiver) MethodOne()

type ParamReceiver func(int, string)

func (prec ParamReceiver) MethodTwo()

type ReturnReceiver func() (int, error)

func (rr ReturnReceiver) MethodThree()

type BothReceiver func(int, string) (io.Writer, error)

func (br BothReceiver) MethodFour()
