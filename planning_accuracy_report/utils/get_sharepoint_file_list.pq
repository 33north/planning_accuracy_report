// Set variables sharepoint_link, filename
(
    sharepoint_link as text,
    filename as text
) as table =>

let
    // Reads sharepoint_link and creates a table of all the files available on the Sharepoint Link
    // Then it looks for the target filename file and returns information about the file
    source = SharePoint.Files(sharepoint_link, [ApiVersion = 15]),
    source_select = Table.SelectRows(source, each ([Name] = filename)),

    // Filters out any hidden files or any ~$ files
    source_filter_hidden_files = Table.SelectRows(source_select, each [Attributes]?[Hidden]? <> true)

in
    // source as table
    source_filter_hidden_files as table