import pyodbc
import pandas as pd
import requests
import json


conn_str = (
    "DRIVER={SQL Server};"
    "SERVER=localhost;"
    "DATABASE=AdventureWorks2022;"
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

def query_llama(prompt, model="mistral3.2"):
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
    You are an AI assistant answering questions about the AdventureWorks2022 database. Convert the following database query result into a natural language response for the question: '{question}'
    
    Result: {result}
    
    Examples:
    Question: How many employees are in the Sales department?
    Result: [(18,)]
    Response: There are 18 employees in the Sales department.
    
    Question: Which sales territory sold the most?
    Result: [('Southwest', 1234567.89)]
    Response: The Southwest territory sold the most with $1,234,567.89 in sales.
    
    Now, provide the response for: {question}
    Result: {result}
    """
    return query_llama(prompt)


def generate_sql(question):
    prompt = f"""
    You are a SQL expert for the AdventureWorks2019 database on Microsoft SQL Server. Convert the following question into a valid SQL query. Return only the SQL query, no explanations.
    
    Question: {question}
    
    Relevant Schema:
    - HumanResources.Employee (BusinessEntityID, JobTitle, HireDate)
    - HumanResources.Department (DepartmentID, Name)
    - HumanResources.EmployeeDepartmentHistory (BusinessEntityID, DepartmentID, EndDate)
    - Sales.SalesOrderHeader (SalesOrderID, TerritoryID, CustomerID)
    - Sales.SalesOrderDetail (SalesOrderID, LineTotal)
    - Sales.SalesTerritory (TerritoryID, Name)
    
    Example Questions and Queries:
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
              ORDER BY TotalSales DESC
    
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
        return f"query: {sql_query}"
    finally:
        cursor.close()

#Chat UI
while True:
    question = input("Ask a question about AdventureWorks (or type 'exit'): ")
    if question.lower() == "exit":
        break
    answer = execute_query(question)
    print(answer)

conn.close()
