from model_interact import query_llama

def generate_sql(question):
    prompt = f"""
    You are a SQL expert for the AdventureWorks2019 database on Microsoft SQL Server. Convert the following question into a valid SQL query. Return the SQL query but use natural language with a friendly tone.
    
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
    
    Now, provide the response for: {question}
    """
    return query_llama(prompt)

def execute_query(question):
    cursor = conn.cursor()
    try:
        if "how many employees in department" in question.lower():
            dept_name = extract_department_name(question)
            if dept_name:
                cursor.execute(query_map["how many employees in department"], (dept_name,))
                result = cursor.fetchone()[0]
                return f"There are {result} employees in the {dept_name} department."
        elif "sales territory sold the most" in question.lower():
            cursor.execute(query_map["sales territory sold the most"])
            result = cursor.fetchone()
            return f"The {result[0]} territory sold the most with ${result[1]:,.2f} in sales."
        else:
            # Use Llama 3.2 to generate SQL for other questions
            sql_query = generate_sql(question)
            cursor.execute(sql_query)
            result = cursor.fetchall()
            return format_response(question, result)
    except Exception as e:
        return f"Error: {str(e)}"
    finally:
        cursor.close()