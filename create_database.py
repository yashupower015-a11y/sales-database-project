import sqlite3

conn = sqlite3.connect("sales.db")
cursor = conn.cursor()

cursor.execute("""
CREATE TABLE IF NOT EXISTS sales (
    sale_id INTEGER PRIMARY KEY,
    customer_name TEXT,
    product TEXT,
    category TEXT,
    amount REAL,
    city TEXT,
    sale_date TEXT
)
""")

data = [
    (1, "Rahul", "Laptop", "Electronics", 55000, "Bangalore", "2026-01-05"),
    (2, "Priya", "Mouse", "Electronics", 1200, "Chennai", "2026-01-08"),
    (3, "Arjun", "Keyboard", "Electronics", 2500, "Mumbai", "2026-01-12"),
    (4, "Sneha", "Chair", "Furniture", 7500, "Bangalore", "2026-01-15"),
    (5, "Kiran", "Desk", "Furniture", 12000, "Hyderabad", "2026-01-18"),
    (6, "Anita", "Monitor", "Electronics", 18000, "Delhi", "2026-01-20"),
    (7, "Vijay", "Notebook", "Stationery", 300, "Chennai", "2026-01-22"),
    (8, "Meena", "Pen", "Stationery", 100, "Mumbai", "2026-01-25"),
    (9, "Ravi", "Headphones", "Electronics", 3500, "Bangalore", "2026-01-27"),
    (10, None, "Printer", "Electronics", 15000, "Hyderabad", "2026-01-30")
]

cursor.executemany("""
INSERT OR IGNORE INTO sales
(sale_id, customer_name, product, category, amount, city, sale_date)
VALUES (?, ?, ?, ?, ?, ?, ?)
""", data)

conn.commit()
conn.close()

print("Sales database created successfully!")