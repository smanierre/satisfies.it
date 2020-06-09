package util

//IsGoFile checks if a file is a go file by looking for the file to end with .go
func IsGoFile(filename string) bool {
	lastThree := filename[len(filename)-3:]
	if lastThree != ".go" {
		return false
	}
	return true
}
