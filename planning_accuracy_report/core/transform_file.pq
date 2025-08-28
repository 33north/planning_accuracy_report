// Function takes in file and sheet_name as parameters
// Excel.Workbook() will read the binary file.
// Explicitly state sheet name for function but if not explicitly stated, 
//   the function will default to the first worksheet.

let
    transform_file = (
        file as binary,
        optional sheet_name as text
    ) as table => 
        let
            source = Excel.Workbook(file, null, true),

            // If sheet_name is provided, use it
            // Otherwise, default to the first sheet
            source_excel_data = 
                if sheet_name <> null then
                    source{[Item = sheet_name, Kind = "Sheet"]}[Data] as table
                else
                    let
                        first_sheet = Table.SelectRows(source, each [Kind] = "Sheet"){0}[Data] as table
                    in
                        first_sheet

        in
            source_excel_data
in
    transform_file