// Generates Buy Log data into this excel file from the original Open PO excel file stored 
//   in T-drive.  The original Open PO excel file is generated from Business Object.
let
    // Calls binary_file_open_po[Content] within tansform_file() function to get excel data
    source = transform_file(binary_file_closed_po[Content]),

    // Removes first column in source data
    source_remove_first_column = Table.RemoveColumns(source, {"Column1"}),

    // Removes top 1 row in source data
    source_removed_top_rows = Table.Skip(source_remove_first_column, 1),

    // Keep rows that are not null
    source_remove_nulls = remove_blank_rows(source_removed_top_rows),

    // Promotes top row as header in source data
    source_promote_headers = promote_headers(source_remove_nulls)

in
    // source as table
    source_promote_headers as table