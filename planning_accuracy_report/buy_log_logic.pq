// Generates Buy Log data into this excel file from the original Open PO excel file stored 
//   in T-drive.  The original Open PO excel file is generated from Business Object.
let
    // Calls binary_file_open_po[Content] within tansform_file() function to get excel data
    source = transform_file(binary_file_buy_log[Content]),

    // Removes top 4 rows in source data
    source_remove_top_rows = Table.Skip(source, 4),

    // Promotes top row as header in source data
    source_promote_headers = promote_headers(source_remove_top_rows)

in
    // source as table
    source_promote_headers as table