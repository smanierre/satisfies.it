package util

//StartsWith returns whether or not the string str starts with the substring. It is case sensitive.
func StartsWith(str, substring string) bool {
	if len(substring) > len(str) {
		return false
	}
	return str[:len(substring)] == substring
}
