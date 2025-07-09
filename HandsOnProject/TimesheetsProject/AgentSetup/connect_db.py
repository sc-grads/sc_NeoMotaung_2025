import pyodbc
import pandas as pd

conn_str = (
    "DRIVER={SQL Server};"
    "SERVER=localhost;"
    "DATABASE=AdventureWorks2022;"
    "Trusted_Connection=yes"
)

conn = pyodbc.connect(conn_str)
cursor = conn.cursor()

query = "SELECT DepartmentID, Name FROM HumanResources.Department"
df = pd.read_sql(query, conn)
cursor.execute("SELECT COUNT(*) FROM HumanResources.Employee")
result = cursor.fetchone()
print(df)

cursor.close()

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

conn.close()
