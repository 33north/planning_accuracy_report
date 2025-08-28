//// Function takes in SharePoint Link, filename_prefix, and filename_extension.
//     Reads the directory based on the SharePoint Link, 
// Set variables sharepoint_link, filename_prefix, filename_extension
(
    sharepoint_link as text,
    filename_prefix as text,
    filename_extension as text
) as table =>

let
    // Reads sharepoint_link and creates a table of all the files available on the Sharepoint Link
    // Then it looks for the target filename file and returns information about the file
    source = SharePoint.Files(sharepoint_link, [ApiVersion = 15]),

    // Reads the SharePoint directory and filters out files that meets the requirements:
    //   the filename in "Name" column matches filename_prefix 
    //   and the file extension in "Extension" column matches filename_extension
    source_sharepoint_files = 
        Table.SelectRows(
            source, 
            each (Text.StartsWith([Name], filename_prefix) and Text.EndsWith([Extension], filename_extension))
    ),

    // Filters out any hidden files or any ~$ files
    source_filter_hidden_files = Table.SelectRows(source_sharepoint_files, each [Attributes]?[Hidden]? <> true),

    // Sort table with newest files at top
    source_sorted_excel_files = Table.Sort(source_filter_hidden_files, {"Date created", Order.Descending})

in
    // source as table
    // source_filter_hidden_files as table
    source_sorted_excel_files as table