package util

import (
	"fmt"
	"go/types"
)

//GetBaseType returns the base type of a defined concrete type (e.g. struct, int, etc...)
func GetBaseType(t types.Type) (string, error) {
	switch t.Underlying().(type) {
	case *types.Struct:
		return "struct", nil
	case *types.Basic:
		b := t.Underlying().(*types.Basic)
		return b.String(), nil
	case *types.Map:
		m := t.Underlying().(*types.Map)
		return m.String(), nil
	case *types.Slice:
		s := t.Underlying().(*types.Slice)
		return s.String(), nil
	case *types.Signature:
		s := t.Underlying().(*types.Signature)
		return s.String(), nil
	case *types.Array:
		a := t.Underlying().(*types.Array)
		return a.String(), nil
	default:
		return "", fmt.Errorf("unknown basetype: %T", t.Underlying())
	}
}
