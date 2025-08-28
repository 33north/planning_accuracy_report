// Function promotes headers of table
(
    table as table
) as table =>

let
    promoted_headers = Table.PromoteHeaders(table, [PromoteAllScalars = true])

in
    promoted_headers