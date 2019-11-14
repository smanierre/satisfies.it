package util

import (
	"fmt"

	"github.com/smanierre/typer"
	"github.com/smanierre/typer-site/model"
)

func ConvertToTypeRecord(types []typer.Type, store model.TypeStore) ([]model.TypeRecord, error) {
	concreteStore, ok := store.(*model.InMemoryTypestore)
	if !ok {
		return nil, fmt.Errorf("unable to cast to *model.InMemoryTypeStore: %v\n")
	}
	var records []model.TypeRecord
	for _, t := range types {
		tr := model.TypeRecord{
			Type: t,
			Id:   concreteStore.Sequence,
		}
		concreteStore.Sequence++
		records = append(records, tr)
	}
	return records, nil
}
