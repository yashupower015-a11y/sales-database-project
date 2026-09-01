import sqlite3

conn = sqlite3.connect("sales.db")
cursor = conn.cursor()

with open("queries_day1.sql", "r") as file:
    sql = file.read()

queries = [q.strip() for q in sql.split(";") if q.strip()]

for i, query in enumerate(queries, 1):
    print(f"\n--- Query {i} ---")
    print(query)

    cursor.execute(query)
    rows = cursor.fetchall()

    for row in rows:
        print(row)

import csv

cursor.execute("SELECT * FROM sales")
rows = cursor.fetchall()

with open("sales_export.csv", "w", newline="") as file:
    writer = csv.writer(file)
    writer.writerow(["id", "customer_name", "product", "category", "amount", "city", "sale_date"])
    writer.writerows(rows)

print("CSV exported successfully!")

conn.close()