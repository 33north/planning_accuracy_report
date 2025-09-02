let
    source = transform_file_sql(
        get_sql_connection("icgTM_FinanceDB_DEV.corp.callawaygolf.com", "TM_Finance"), 
        "dbo", 
        "tbl_Demand_Planning_Current_Fcst"
        )

in
    source