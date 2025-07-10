import chromadb
from chromadb.utils import embedding_functions

client = chromadb.Client()
embedding_function = embedding_functions.SentenceTransformerEmbeddingFunction(model_name="all-MiniLM-L6-v2")
collection = client.get_or_create_collection(name="timesheetdb_schema", embedding_function=embedding_function)

schema_documents = [
    {
        "id": "1",
        "content": """
            Table: Timesheet
            Columns: TimesheetID(INT), EmployeeID (INT), EntryDate(DATETIME), DayOfTheWeek (NVARCHAR), ClientID (INT), Project(NVARCHAR), DescriptionID (INT), BillOrNonBill (NVARCHAR), Comments (NARCHAR), TotalHours, StartTime (DATETIME), EndTime (DATETIME)
            Description: Stores the personal account of every employee of a specific time period between StartTime and EndTime.
        """,
        "metadata": {"table": "dbo.TimesheetDB"}
    },
    {
        "id": "2",
        "content": """
            Table: Leave
            Columns: LeaveID, WorkbookFileID, EmployeeID, TypeOfLeave, StartDate, EndDate, NumberOfDays
            Description: Stores the details 0of every leave day that an employee has taken.
        """,
        "metadata": {"table": "dbo.Leave"}
    },
    {
        "id": "3",
        "content": """
            Table: WorkbookFile
            Columns: WorkbookFileID, NameOfFile
            Description: Stores every excel workbook file name that was used to extract the data from.
        """,
        "metadata": {"table": "dbo.WorkbookFile"}
    },
    {
        "id": "3",
        "content": """
            Table: WorkbookFile
            Columns: WorkbookFileID, NameOfFile
            Description: Stores every excel workbook file name that was used to extract the data from.
        """,
        "metadata": {"table": "dbo.WorkbookFile"}
    },
    {
        "id": "3",
        "content": """
            Table: WorkbookFile
            Columns: WorkbookFileID, NameOfFile
            Description: Stores every excel workbook file name that was used to extract the data from.
        """,
        "metadata": {"table": "dbo.WorkbookFile"}
    },
    {
        "id": "3",
        "content": """
            Table: WorkbookFile
            Columns: WorkbookFileID, NameOfFile
            Description: Stores every excel workbook file name that was used to extract the data from.
        """,
        "metadata": {"table": "dbo.WorkbookFile"}
    },
]