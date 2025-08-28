// This gets the binary file of the latest file in the folder_path
// This is the actual file data in binary form
// This will be passed to function like Excel.Workbook() to extract sheets and tables
let
    // folder_path = "T:\Operations Reports\Open PO Report Receiving",
    folder_path = "T:\Demand Planning\Buys\Buy Logs",
    // filename_prefix = "Open PO Report by Vendor",
    filename_prefix = "SS25 Buy Log",
    filename_extension = ".xlsx",

    // Calls GetLatestFileList function
    latest_file_list = get_latest_file_list(
        folder_path,
        filename_prefix,
        filename_extension
        ),
    
    binary_of_latest_file = latest_file_list{0}[Content]
    
in
    latest_file_list{0} as record
    // binary_of_latest_file as binary