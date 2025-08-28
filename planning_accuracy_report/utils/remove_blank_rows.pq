(
    table as table
) as table =>

let
    // Keeps only the rows where at least one column has real data where any row that is completely blank or null across all columns is filtered out
    //   Looks at current row and list all column values
    //   Removes any "" or null from the list
    //   Check if remaining list is empty 
    //   Keep current row only if contains at least one non-empty, non-null value
    removed_blank_rows = Table.SelectRows(
        table, 
        each not List.IsEmpty(
            List.RemoveMatchingItems(Record.FieldValues(_), {"", null})
            )
        )

in
    removed_blank_rows