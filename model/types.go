package model

// InterfaceRecord is a type that represents an interface parsed from a go source file.
type InterfaceRecord struct {
	Package string         `json:"Package"`
	Name    string         `json:"Name"`
	Methods []MethodRecord `json:"Methods"`
	ID      int            `json:"ID"`
}

// ConcreteTypeRecord is a type that represents a concrete type parsed from a go source file.
type ConcreteTypeRecord struct {
	Package  string            `json:"Package"`
	Name     string            `json:"Name"`
	BaseType string            `json:"BaseType"`
	Methods  []MethodRecord    `json:"Methods"`
	Fields   map[string]string `json:"Fields"`
	ID       int               `json:"ID"`
}

// MethodRecord is a type that represents a method parsed from a go source file.
type MethodRecord struct {
	Package      string   `json:"Package"`
	Name         string   `json:"Name"`
	Parameters   []string `json:"Parameters"`
	ReturnValues []string `json:"ReturnValues"`
	ReceiverID   int      `json:"ReceiverID"`
	ID           int      `json:"ID"`
}
