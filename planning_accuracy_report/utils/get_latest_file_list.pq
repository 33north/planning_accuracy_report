// Set variables folder_path, filename_prefex, and filename_extension
(
    folder_path as text,
    filename_prefix as text,
    filename_extension as text
) as table =>

let
    // Reads folder_path and creates a table of all files that meet the 
    //   filename_prefex and filename_extension requirements
    source = Folder.Files(folder_path),
    source_excel_files_list = Table.SelectRows(source, each 
        Text.StartsWith([Name], filename_prefix) and 
        Text.EndsWith([Extension], filename_extension)
        ),

    // Filters out any hidden files or any ~$ files
    source_filter_hidden_files = Table.SelectRows(source_excel_files_list, each [Attributes]?[Hidden]? <> true),

    // Sort table with newest files at top
    source_sorted_excel_files = Table.Sort(source_filter_hidden_files, {"Date created", Order.Descending})

in
    source_sorted_excel_files as table