package server

import (
	"embed"
	"fmt"
	"html/template"
	"strings"

	"gitlab.com/sean.manierre/typer-site/store"
)

//ParseTemplates takes in a glob describing what templates should be parsed.
func ParseTemplates(dir embed.FS) (*template.Template, error) {
	tpl := template.New("")
	tpl = tpl.Funcs(funcs)
	tpl, err := tpl.ParseFS(dir, "**/*.gohtml")
	if err != nil {
		return nil, fmt.Errorf("error when parsing FS: %s", err.Error())
	}
	return tpl, nil
}

//When adding a template func, make sure to add it to the FuncMap so it gets loaded for the templates.
var funcs = template.FuncMap{"sum": sum, "formatMethod": formatMethod}

func sum(nums ...int) int {
	total := 0
	for _, n := range nums {
		total += n
	}
	return total
}

func formatMethod(m store.Method) string {
	sig := strings.Builder{}
	_, err := sig.Write([]byte(m.Name))
	if err != nil {
		return ""
	}
	_, err = sig.Write([]byte("("))
	if err != nil {
		return ""
	}
	if len(m.Parameters) > 1 {
		for i, v := range m.Parameters {
			if len(m.Parameters)-1 == i {
				_, err = sig.Write([]byte(v))
				if err != nil {
					return ""
				}
			} else {
				_, err = sig.Write([]byte(v))
				if err != nil {
					return ""
				}
				_, err = sig.Write([]byte(", "))
				if err != nil {
					return ""
				}
			}
		}
	} else if len(m.Parameters) == 1 {
		_, err = sig.Write([]byte(m.Parameters[0]))
		if err != nil {
			return ""
		}
	}
	_, err = sig.Write([]byte(") "))
	if err != nil {
		return ""
	}
	if len(m.ReturnValues) > 1 {
		_, err = sig.Write([]byte("("))
		if err != nil {
			return ""
		}
		for i, v := range m.ReturnValues {
			if len(m.ReturnValues)-1 == i {
				_, err = sig.Write([]byte(v))

				if err != nil {
					return ""
				}
			} else {
				_, err = sig.Write([]byte(v))
				if err != nil {
					return ""
				}
				_, err = sig.Write([]byte(", "))
				if err != nil {
					return ""
				}
			}
		}
		_, err = sig.Write([]byte(")"))
		if err != nil {
			return ""
		}
	} else if len(m.ReturnValues) == 1 {
		_, err = sig.Write([]byte(m.ReturnValues[0]))
		if err != nil {
			return ""
		}
	}
	return sig.String()
}
