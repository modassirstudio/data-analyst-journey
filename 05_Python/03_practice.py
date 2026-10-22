price = 50
quantity = 3
total = price * quantity
print("Total: ₹", total)

sales = [100, 200, 150, 300, 250]
for index, sale in enumerate(sales, start = 1):
    print(f"Sale {index}: {sale}")

products = {
    "Pen": 10,
    "Notebook": 50,
    "Marker": 25,
    "Eraser": 5
}
for product, price in products.items():
    print(f"{product}: {price}")

def greet(name):
    return f"Hello, {name}!"

print(greet("Modassir"))
print(greet("World"))