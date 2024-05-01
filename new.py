from flask import Flask, render_template, request

app = Flask(__name__)

# Sample items
items = ["Ice cream", "Water cup", "Shaurma na odin zub", "Schaurma Zub"]

# Sample orders
orders = []

@app.route('/')
def index():
    return render_template('index.html', items=items, orders=orders)

@app.route('/add_order', methods=['POST'])
def add_order():
    order_item = request.form['item']
    orders.append(order_item)
    return render_template('index.html', items=items, orders=orders)

@app.route('/remove_order', methods=['POST'])
def remove_order():
    order_item = request.form['item']
    orders.remove(order_item)
    return render_template('index.html', items=items, orders=orders)

@app.route('/change_mode', methods=['GET', 'POST'])
def change_mode():
    if request.method == 'POST':
        # Handle other actions in this mode
        action = request.form['action']
        if action == 'done':
            # Handle "done" action
            pass
        # Handle other actions
    return render_template('orders.html', orders=orders)

if __name__ == '__main__':
    app.run(debug=True)
  
