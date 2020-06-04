package util

import "strings"

//GetFileName takes in the path to a file and returns only the filename, including the extension.
func GetFileName(filepath string) string {
	lastSlash := strings.LastIndex(filepath, "/")
	return filepath[lastSlash+1:]
}
