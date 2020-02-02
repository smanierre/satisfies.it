package util

//StartsWithUpper takes a string and returns a boolean indicating whether or not it starts with an uppercase later.
func StartsWithUppercase(s string) bool {
	if len(s) == 0 {
		return false
	}
	if s[0] >= 65 && s[0] <= 90 {
		return true
	}
	return false
}
