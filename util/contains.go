package util

//Contains takes a slice of integers and an integer and returns whether or not the slice contains the integer.
func Contains(s []int, i int) bool {
	for _, n := range s {
		if i == n {
			return true
		}
	}
	return false
}
