package sqlite

var createTablesQueries = map[string]string{
	"custom_types":           "CREATE TABLE IF NOT EXISTS custom_types(id INTEGER PRIMARY KEY, package VARCHAR(255), name VARCHAR(255));",
	"concrete_types":         "CREATE TABLE IF NOT EXISTS concrete_types(id INTEGER, pointer BOOLEAN, base_type VARCHAR(255), CONSTRAINT fk_custom_type FOREIGN KEY(id) REFERENCES custom_types(id) ON DELETE CASCADE);",
	"methods":                "CREATE TABLE IF NOT EXISTS methods(id INTEGER PRIMARY KEY, name VARCHAR(255), receiver_id INTEGER, CONSTRAINT fk_type FOREIGN KEY(receiver_id) REFERENCES custom_types(id) ON DELETE CASCADE);",
	"interface_implementers": "CREATE TABLE IF NOT EXISTS interface_implementers(interface_id INTEGER, implementer_id INTEGER, CONSTRAINT fk_interface_id FOREIGN KEY(interface_id) REFERENCES custom_types(id) ON DELETE CASCADE, CONSTRAINT fk_type_id FOREIGN KEY(implementer_id) REFERENCES custom_types(id) ON DELETE SET NULL);",
	"type_implementees":      "CREATE TABLE IF NOT EXISTS type_implementees(type_id INTEGER, implementee_id INTEGER, CONSTRAINT fk_type_id FOREIGN KEY(type_id) REFERENCES custom_types(id) ON DELETE CASCADE, CONSTRAINT fk_interface_id FOREIGN KEY(implementee_id) REFERENCES custom_types(id) ON DELETE SET NULL);",
	"method_parameters":      "CREATE TABLE IF NOT EXISTS method_parameters(method_id INTEGER, parameter_id INTEGER PRIMARY KEY, position INTEGER, parameter_type VARCHAR(255), CONSTRAINT fk_method_id FOREIGN KEY(method_id) REFERENCES  methods(id) ON DELETE CASCADE);",
	"method_return_values":   "CREATE TABLE IF NOT EXISTS method_return_values(method_id INTEGER, return_value_id INTEGER PRIMARY KEY, position INTEGER, parameter_type VARCHAR(255), CONSTRAINT fk_method_id FOREIGN KEY(method_id) REFERENCES methods(id) ON DELETE CASCADE);",
}

var (
	getCustomTypeCountQuery                       = "SELECT count(*) from custom_types;"
	selectAllInterfacesQuery                      = "SELECT cut.id, cut.package, cut.name FROM custom_types as cut FULL JOIN concrete_types as ct ON cut.id=ct.id WHERE ct.pointer IS NULL;"
	selectInterfaceImplementersByInterfaceIDQuery = "SELECT implementer_id FROM interface_implementers WHERE interface_id=$1;"
	selectTypeImplementeesByTypeIDQuery           = "SELECT implementee_id FROM type_implementees WHERE type_id=$1;"
	selectAllConcreteTypesQuery                   = "SELECT cut.id, cut.package, cut.name, ct.pointer, ct.base_type FROM custom_types as cut FULL JOIN concrete_types as ct ON cut.id=ct.id WHERE ct.pointer IS NOT NULL;"
	selectMethodByReceiverQuery                   = "SELECT id, name, receiver_id FROM methods WHERE receiver_id=$1;"
	selectMethodParametersByMethodIdQuery         = "SELECT parameter_type FROM method_parameters WHERE method_id=$1 ORDER BY position ASC;"
	selectMethodReturnValuesByMethodIdQuery       = "SELECT parameter_type FROM method_return_values WHERE method_id=$1 ORDER BY position ASC;"
	selectAllMethodsQuery                         = "SELECT * FROM methods;"
	insertCustomTypeQuery                         = "INSERT INTO custom_types(package, name) VALUES($1, $2) returning id;"
	insertConcreteTypeQuery                       = "INSERT INTO concrete_types(id, pointer, base_type) VALUES($1, $2, $3) returning id;"
	insertMethodQuery                             = "INSERT INTO methods(name, receiver_id) values($1, $2) RETURNING id;"
	insertInterfaceImplementersQuery              = "INSERT INTO interface_implementers(interface_id, implementer_id) values($1, $2);"
	insertTypeImplementeeQuery                    = "INSERT INTO type_implementees(type_id, implementee_id) values($1, $2);"
	insertMethodParameterQuery                    = "INSERT INTO method_parameters(method_id, position, parameter_type) values($1, $2, $3);"
	insertMethodReturnValueQuery                  = "INSERT INTO method_return_values(method_id, position, parameter_type) values($1, $2, $3);"
)
