package util

import "strings"

//IsTestFile checks to see if the file is a go test file by whether or not it follows the xxx_test.go naming convention.
func IsTestFile(filename string) bool {
	if strings.Contains(filename, "_test.go") {
		return true
	}
	return false
}
