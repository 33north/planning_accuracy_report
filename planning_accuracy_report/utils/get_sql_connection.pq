// Set variables server, database
(
    server as text,
    database as text
) as table =>

let
    // Reads server and returns table of sql tables, views, and stored functions from database
    // Then it looks for the target database file and returns information about the database
    source = Sql.Database(server, database) as table

in
    source as table