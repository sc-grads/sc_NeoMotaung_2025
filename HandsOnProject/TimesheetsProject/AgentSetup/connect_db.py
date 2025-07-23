import pyodbc
import pandas as pd
import requests
import json


conn_str = (
    "DRIVER={SQL Server};"
    "SERVER=localhost;"
    "DATABASE=TimesheetDB;"
    "Trusted_Connection=yes"
)

conn = pyodbc.connect(conn_str)
"""cursor = conn.cursor()

query = "SELECT DepartmentID, Name FROM HumanResources.Department"
df = pd.read_sql(query, conn)
cursor.execute("SELECT COUNT(*) FROM HumanResources.Employee")
result = cursor.fetchone()
print(df)

cursor.close()"""

def query_llama(prompt, model="llama3"):
    url = "http://localhost:11434/api/generate"
    payload = {
        "model": model,
        "prompt": prompt,
        "stream": False
    }
    response = requests.post(url, json=payload)
    if response.status_code == 200:
        return json.loads(response.text)["response"]
    else:
        raise Exception(f"Ollama API error: {response.text}")
    
#test_prompt = "Hello, I'm testing Llama 3.2. Can you respond with 'Success'?"
#print(query_llama(test_prompt))  # Should print "Success"


def format_response(question, result):
    prompt = f"""
    You are an AI assistant answering questions about the TimesheetDB database. Convert the following database query result into a natural language response for the question: '{question}'
    
    Result: {result}
    
    
    Now, provide the response for: {question}
    Result: {result}
    """
    return query_llama(prompt)

"""Examples:
    Question: How many employees are in the Sales department?
    Result: [(18,)]
    Response: There are 18 employees in the Sales department.
    
    Question: Which sales territory sold the most?
    Result: [('Southwest', 1234567.89)]
    Response: The Southwest territory sold the most with $1,234,567.89 in sales."""

"""    Relevant Schema:
    - HumanResources.Employee (BusinessEntityID, JobTitle, HireDate)
    - HumanResources.Department (DepartmentID, Name)
    - HumanResources.EmployeeDepartmentHistory (BusinessEntityID, DepartmentID, EndDate)
    - Sales.SalesOrderHeader (SalesOrderID, TerritoryID, CustomerID)
    - Sales.SalesOrderDetail (SalesOrderID, LineTotal)
    - Sales.SalesTerritory (TerritoryID, Name)"""

"""Example Questions and Queries:
    1. Question: How many employees are in the Sales department?
       Query: SELECT COUNT(*) FROM HumanResources.Employee e
              JOIN HumanResources.EmployeeDepartmentHistory edh ON e.BusinessEntityID = edh.BusinessEntityID
              JOIN HumanResources.Department d ON edh.DepartmentID = d.DepartmentID
              WHERE d.Name = 'Sales' AND edh.EndDate IS NULL
    2. Question: Which sales territory sold the most?
       Query: SELECT TOP 1 st.Name, SUM(sod.LineTotal) as TotalSales
              FROM Sales defensorily.SalesOrderHeader soh
              JOIN Sales.SalesOrderDetail sod ON soh.SalesOrderID = sod.SalesOrderID
              JOIN Sales.SalesTerritory st ON soh.TerritoryID = st.TerritoryID
              GROUP BY st.Name
              ORDER BY TotalSales DESC"""


def generate_sql(question):
    prompt = f"""
    You are an experienced Relational Database Administrator with a very high level of skill with SQL. You are now working with the TimesheetDB database on Microsoft SQL Server. You must be able to take a query or question in natural language, understand what is being asked and create a SQL query that can accurately answer the question you have received. Make sure to remember syntax rules and avoid errors, keep in mind of any parenthesis. Return only the SQL query, no explanations or any other text, just the query alone.
    
    The Schema for TimesheetDB:
    - Timesheet (TimesheetID (Primary Key), EmployeeID (Foreign Key, connects to the Employee table), EntryDate (Format: yyyy-mm-dd), DayOfTheWeek, ClientID (Foreign Key, connects to the Client table), Project, DescriptionID (Foreign Key, connects to the Description table), BillOrNonBill, Comments (A detailed explanation of what was done for that entry), TotalHours, StartTime, EndTime)
    - Leave (LeaveID (Primary Key, used as a foreign key in the Timesheet Table), WorkbookFileID (Foreign Key, connects to the WorkbookFile table), EmployeeID (Foreign Key, connects to the Employee table), TypeOfLeave, StartDate, EndDate, NumberOfDays)
    - WorkbookFile (WorkbookFileID (Primary Key, used as a foreign key in the Leave Table), NameOfFile)
    - Employee (EmployeeID (Primary Key, used as a foreign key in the Timesheet Table and Leave Table), EmployeeName)
    - Description (DescriptionID (Primary Key, used as a foreign key in the Timesheet Table), DescText)
    - Client (ClientID (Primary Key, used as a foreign key in the Timesheet Table), ClientName)
    - AuditLogs (LogID (Primary Key), EventType, FileName, PackageName, TaskName, DestinationTable, ActionType, RowsProcessed, Machine, UserName, LogTime)
    - ErrorLog (ErrorID (Primary Key), SheetFileName, TaskName, ErrorCode, ErrorMsg, ErrorTime)

    Do not make any DML queries such as DELETE, UPDATE, MODIFY or INSERT.
    Try to consider any relationships and connections between tables particularly the Timesheet, Leave, Client, Description and Employee tables as your queries may require joins. Have a deep understanding of the schema provided for you.

    Note that the date column for Timesheet is in the yyyy-mm-dd format, so if a question involves a date like 'What did Neo do on the 14th of April at 8:00 am' or 'What did Neo do on April 14', be aware that it correlates to 2025-04-14 for example.
    If asked what was done during a particular day or timeslot, just inspect the comment column to get information about the employee's activities.

    
    Question: {question}
    
    
    Now, provide the SQL query for: {question}
    """
    return query_llama(prompt)

def execute_query(question):
    cursor = conn.cursor()
    try:
        # Use Llama 3.2 to generate SQL for other questions
        sql_query = generate_sql(question)
        cursor.execute(sql_query)
        result = cursor.fetchall()
        return format_response(question, result)
    except Exception as e:
        #return f"Error: {str(e)}"
        return f"Error: {str(e)}\nquery: {sql_query}"
    finally:
        cursor.close()

#Chat UI
while True:
    question = input("Ask a question about Timesheet (or type 'exit'): ")
    if question.lower() == "exit":
        break
    answer = execute_query(question)
    print(answer)

conn.close()
