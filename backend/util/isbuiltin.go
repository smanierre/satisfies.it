package util

var builtinTypes = []string{
	"bool",
	"string",
	"int",
	"int8",
	"int16",
	"int32",
	"int64",
	"uint",
	"uint8",
	"uint16",
	"uint32",
	"uint64",
	"uintptr",
	"byte",
	"rune",
	"float32",
	"float64",
	"complex64",
	"complex128",
	"error",
	"chan",
}

type Test []byte

//IsBuiltinType takes a type name string and returns a boolean indicating whether or not it is a builtin Go type
func IsBuiltinType(s string) bool {
	for _, t := range builtinTypes {
		if s == t {
			return true
		}
	}
	return false
}
