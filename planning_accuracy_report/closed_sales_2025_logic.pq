// Generates Buy Log data into this excel file from the original Open PO excel file stored 
//   in T-drive.  The original Open PO excel file is generated from Business Object.
let
    // Calls binary_file_open_po[Content] within tansform_file() function to get excel data
    source = transform_file(binary_file_closed_sales[Content], "202501-202509"),
    // source_sheet_1 = transform_file(binary_file_closed_sales[Content], "Basics Sales Data"),
    // source_sheet_2 = transform_file(binary_file_closed_sales[Content], "Basics Sales Data(1)"),

    // Combines both data into one source
    // source = Table.Combine({source_sheet_1, source_sheet_2}),

    // Removes first column in source data
    // source_remove_first_column = Table.RemoveColumns(source, {"Column1"}),

    // Removes top 1 row in source data
    // source_remove_top_rows = Table.Skip(source_remove_first_column, 1),

    // Promotes top row as header in source data
    // source_promote_headers = promote_headers(source_remove_top_rows),
    source_promote_headers = promote_headers(source),

    // Adds Index column to help with chunking the 1million+ row data
    source_add_column_index = Table.AddIndexColumn(source_promote_headers, "Index", 1, 1, Int64.Type),

    // Chunksize
    // CHUNKSIZE = 500000,
    CHUNKSIZE = 1000,

    // Add chunk number to column
    source_add_chunk = Table.AddColumn(
        source_add_column_index, 
        "ChunkNumber", 
        each Number.IntegerDivide([Index] - 1, CHUNKSIZE) + 1,
        Int64.Type
        ),

    // Filters the data by chunks
    source_filter_data_by_chunks = Table.SelectRows(source_add_chunk, each [ChunkNumber] <= 1)

in
    // source as table
    source_promote_headers as table
    // source_add_column_index as table
    // source_add_chunk as table
    // source_filter_data_by_chunks as table