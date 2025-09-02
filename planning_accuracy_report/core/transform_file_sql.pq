// Function takes in schema and item as parameters
// Explicitly state Schema and Item values for function.
// Schema and Item values can be gotten by calling the get_sql_connection.pq function first to get a list of available columns, among them should be Schema and Item.
//   Find the target Schema and Item values and when using transform_file_sql.pq, make sure to have the correct values.

let
    transform_file = (
        database_connection as table,
        schema as text,
        item as text
    ) as table => 
        let
            source_sql_data = database_connection{[Schema = schema, Item = item]}[Data] as table

        in
            source_sql_data
in
    transform_file