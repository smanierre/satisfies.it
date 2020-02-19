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
		{"empty string", "", false},
	}

	for _, tt := range tc {
		t.Run(tt.Name, func(t *testing.T) {
			if StartsWithUppercase(tt.TestString) != tt.Expected {
				t.Errorf("\"%s\" should have returned %t, instead returned: %t\n", tt.TestString, tt.Expected, StartsWithUppercase(tt.TestString))
			}
		})
	}
}

func TestContains(t *testing.T) {
	tc := []struct {
		Name      string
		TestSlice []int
		TestNum   int
		Expected  bool
	}{
		{"empty array", []int{}, 1, false},
		{"contains once", []int{1, 2, 3, 4, 5, 6, 7, 8, 9}, 3, true},
		{"contains multiple times", []int{1, 2, 3, 4, 5, 6, 7, 8, 1}, 1, true},
		{"doesn't contain", []int{1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, 11, false},
	}

	for _, tt := range tc {
		t.Run(tt.Name, func(t *testing.T) {
			if Contains(tt.TestSlice, tt.TestNum) != tt.Expected {
				t.Errorf("%t return for slice: %v, expected %t\n", !tt.Expected, tt.TestSlice, tt.Expected)
			}
		})
	}
}
