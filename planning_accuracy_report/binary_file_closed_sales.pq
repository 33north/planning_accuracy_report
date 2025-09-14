// This gets the binary file of the latest file in the folder_path
// This is the actual file data in binary form
// This will be passed to function like Excel.Workbook() to extract sheets and tables
let
    //// Original location of the Closed Sales data
    // folder_path = "T:\Demand Planning\Carry ATS review\Exports\Closed Sales",
    // filename_prefix = "Closed sales - size level",

    //// Closed Sales data that has been partially cleaned
    folder_path = "C:\Users\luan.nguyen\Documents\monolith\planning_accuracy_report\__raw_data",
    filename_prefix = "closed_sales",
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