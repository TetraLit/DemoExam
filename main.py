from flask import Flask, render_template, request

import mysql.connector

app = Flask(__name__)


def get_db():
    return mysql.connector.connect(host='localhost', user='root', password='', database='demka2')

def calc_discount(total_quantity):
    if total_quantity < 10000:
        return 0
    elif total_quantity < 50000:
        return 5
    elif total_quantity < 300000:
        return 10
    else:
        return 15

@app.route('/partners')
def partners():
    db = get_db()
    cursor = db.cursor(dictionary=True)
    cursor.execute("SELECT * FROM partners")
    partners = cursor.fetchall()
    # Для каждого партнера посчитать объём продаж и скидку
    for p in partners:
        cursor.execute("SELECT SUM(quantity) AS total FROM partner_products WHERE partner_id=%s", (p['id'],))
        result = cursor.fetchone()
        total = result["total"] if result and result["total"] is not None else 0
        p['discount'] = calc_discount(total)
    db.close()
    return render_template('partners.html', partners=partners)

@app.route('/partners/<int:partner_id>/history')
def partner_history(partner_id):
    db = get_db()
    cursor = db.cursor(dictionary=True)
    # Получаем данные по партнеру
    cursor.execute("SELECT * FROM partners WHERE id=%s", (partner_id,))
    partner = cursor.fetchone()
    # Получаем историю продаж по партнеру
    cursor.execute("""
        SELECT pp.id, pp.sale_date, pp.quantity, p.name as product_name
        FROM partner_products pp
        JOIN products p ON pp.product_id = p.id
        WHERE pp.partner_id = %s
        ORDER BY pp.sale_date DESC
    """, (partner_id,))
    sales = cursor.fetchall()
    db.close()
    return render_template('partner_history.html', partner=partner, sales=sales)

@app.route('/partners/<int:partner_id>/add_sale', methods=['GET', 'POST'])
def add_sale(partner_id):
    db = get_db()
    cursor = db.cursor(dictionary=True)
    # Получим список продуктов
    cursor.execute("SELECT id, name FROM products")
    products = cursor.fetchall()
    if request.method == 'POST':
        product_id = request.form['product_id']
        quantity = request.form['quantity']
        sale_date = request.form['sale_date']
        cursor = db.cursor()
        cursor.execute(
            "INSERT INTO partner_products (partner_id, product_id, quantity, sale_date) VALUES (%s, %s, %s, %s)",
            (partner_id, product_id, quantity, sale_date)
        )
        db.commit()
        db.close()
        return redirect(url_for('partner_history', partner_id=partner_id))
    db.close()
    return render_template('add_sale.html', partner_id=partner_id, products=products)

@app.route('/partners/<int:partner_id>/edit_sale/<int:sale_id>', methods=['GET', 'POST'])
def edit_sale(partner_id, sale_id):
    db = get_db()
    cursor = db.cursor(dictionary=True)
    # Получить список продуктов для выбора
    cursor.execute("SELECT id, name FROM products")
    products = cursor.fetchall()
    # Получить текущие данные продажи
    cursor.execute("SELECT * FROM partner_products WHERE id=%s", (sale_id,))
    sale = cursor.fetchone()
    if request.method == 'POST':
        product_id = request.form['product_id']
        quantity = request.form['quantity']
        sale_date = request.form['sale_date']
        cursor = db.cursor()
        cursor.execute(
            "UPDATE partner_products SET product_id=%s, quantity=%s, sale_date=%s WHERE id=%s",
            (product_id, quantity, sale_date, sale_id)
        )
        db.commit()
        db.close()
        return redirect(url_for('partner_history', partner_id=partner_id))
    db.close()
    return render_template('edit_sale.html', partner_id=partner_id, sale=sale, products=products)

@app.route('/partners/<int:partner_id>/delete_sale/<int:sale_id>', methods=['POST'])
def delete_sale(partner_id, sale_id):
    db = get_db()
    cursor = db.cursor()
    cursor.execute("DELETE FROM partner_products WHERE id=%s", (sale_id,))
    db.commit()
    db.close()
    return redirect(url_for('partner_history', partner_id=partner_id))


# остальной код (добавление, редактирование и т.д.) можно оставить по желанию
if __name__ == '__main__':
    app.run(debug=True)
