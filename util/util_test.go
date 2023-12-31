package util

import (
	"testing"
)

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

func TestGetFileName(t *testing.T) {
	tc := []struct {
		Name     string
		TestPath string
		Expected string
	}{
		{"normal filepath", "/home/user/project/main.go", "main.go"},
		{"without extension", "/home/user/project/main", "main"},
		{"with numbers", "/home/user/project/12", "12"},
	}

	for _, tt := range tc {
		t.Run(tt.Name, func(t *testing.T) {
			if name := GetFileName(tt.TestPath); name != tt.Expected {
				t.Errorf("Expected name: %s, got: %s\n", tt.Expected, name)
			}
		})
	}
}

func TestIsTestFile(t *testing.T) {
	tc := []struct {
		Name     string
		TestName string
		Expected bool
	}{
		{"testfile", "parser_test.go", true},
		{"non-testfile", "parser.go", false},
	}

	for _, tt := range tc {
		t.Run(tt.Name, func(t *testing.T) {
			if result := IsTestFile(tt.TestName); result != tt.Expected {
				t.Errorf("Expected: %t for name %s. Got: %t\n", tt.Expected, tt.Name, result)
			}
		})
	}
}

func TestIsGoFile(t *testing.T) {
	tc := []struct {
		Name     string
		TestName string
		Expected bool
	}{
		{"Go file", "file.go", true},
		{"Non Go file", "file.cpp", false},
		{"Multiple Extensions", "file.go.gz", false},
		{"Multiple extensions before .go", "file.pb.go", true},
		{"Filename shorter than 3 characters", "a", false},
		{"Actual file shorter than 3 characters", "d.h", false},
		{"Empty string", "", false},
	}

	for _, tt := range tc {
		t.Run(tt.Name, func(t *testing.T) {
			if result := IsGoFile(tt.TestName); result != tt.Expected {
				t.Errorf("Expected %t for name %s but got %t.\n", tt.Expected, tt.TestName, result)
			}
		})
	}
}

func TestStartsWith(t *testing.T) {
	tc := []struct {
		Name          string
		TestString    string
		TestSubstring string
		Expected      bool
	}{
		{"Empty strings", "", "", true},
		{"Does start with", "Hello, world!", "Hello,", true},
		{"Wrong case", "Hello, world!", "hello,", false},
		{"Substring longer than string", "", "hello,", false},
		{"Blank substring", "Hello, World!", "", true},
	}

	for _, tt := range tc {
		t.Run(tt.Name, func(t *testing.T) {
			if result := StartsWith(tt.TestString, tt.TestSubstring); result != tt.Expected {
				t.Errorf("Expected %t for substring %s in string %s but got %t.\n", tt.Expected, tt.TestSubstring, tt.TestString, result)
			}
		})
	}
}
