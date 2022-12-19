package sqlite

var createTablesQueries = map[string]string{
	"custom_types":           "CREATE TABLE IF NOT EXISTS custom_types(id SERIAL PRIMARY KEY, package VARCHAR(255), name VARCHAR(255));",
	"concrete_types":         "CREATE TABLE IF NOT EXISTS concrete_types(id INTEGER, pointer BOOLEAN, base_type VARCHAR(255), CONSTRAINT fk_custom_type FOREIGN KEY(id) REFERENCES custom_types(id) ON DELETE CASCADE);",
	"methods":                "CREATE TABLE IF NOT EXISTS methods(id serial PRIMARY KEY, name VARCHAR(255), receiver_id INTEGER, CONSTRAINT fk_type FOREIGN KEY(receiver_id) REFERENCES custom_types(id) ON DELETE CASCADE);",
	"interface_implementers": "CREATE TABLE IF NOT EXISTS interface_implementers(interface_id INTEGER, implementer_id INTEGER, CONSTRAINT fk_interface_id FOREIGN KEY(interface_id) REFERENCES custom_types(id) ON DELETE CASCADE, CONSTRAINT fk_type_id FOREIGN KEY(implementer_id) REFERENCES custom_types(id) ON DELETE SET NULL);",
	"type_implementees":      "CREATE TABLE IF NOT EXISTS type_implementees(type_id INTEGER, implementee_id INTEGER, CONSTRAINT fk_type_id FOREIGN KEY(type_id) REFERENCES custom_types(id) ON DELETE CASCADE, CONSTRAINT fk_interface_id FOREIGN KEY(implementee_id) REFERENCES custom_types(id) ON DELETE SET NULL);",
	"method_parameters":      "CREATE TABLE IF NOT EXISTS method_parameters(method_id INTEGER, parameter_id INTEGER, position INTEGER, parameter_type VARCHAR(255), CONSTRAINT fk_method_id FOREIGN KEY(method_id) REFERENCES  methods(id) ON DELETE CASCADE);",
	"method_return_values":   "CREATE TABLE IF NOT EXISTS method_return_values(method_id INTEGER, return_value_id INTEGER, position INTEGER, parameter_type VARCHAR(255), CONSTRAINT fk_method_id FOREIGN KEY(method_id) REFERENCES methods(id) ON DELETE CASCADE);",
}
