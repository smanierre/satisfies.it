package util

import "testing"

func TestIsBuiltin(t *testing.T) {
	tc := []struct {
		Name       string
		TestString string
		Expected   bool
	}{
		{"correct type", "bool", true},
		{"correct type", "int", true},
		{"unabbreviated type name", "boolean", false},
		{"capital type name", "Bool", false},
		{"one number off", "int33", false},
	}

	for _, tt := range tc {
		t.Run(tt.Name, func(t *testing.T) {
			if IsBuiltinType(tt.TestString) != tt.Expected {
				t.Errorf("\"%s\" should have returned: %t, instead returned: %t\n", tt.TestString, tt.Expected, IsBuiltinType(tt.TestString))
			}
		})
	}
}

func TestStartsWithUpperCase(t *testing.T) {
	tc := []struct {
		Name       string
		TestString string
		Expected   bool
	}{
		{"starts with uppercase", "Abcde", true},
		{"starts with lowercase", "abcde", false},
		{"starts with a space", " abcde", false},
		{"starts with a period", ".abcde", false},
		{"starts with a number", "1abcde", false},
	}

	for _, tt := range tc {
		t.Run(tt.Name, func(t *testing.T) {
			if StartsWithUppercase(tt.TestString) != tt.Expected {
				t.Errorf("\"%s\" should have returned %t, instead returned: %t\n", tt.TestString, tt.Expected, StartsWithUppercase(tt.TestString))
			}
		})
	}
}
