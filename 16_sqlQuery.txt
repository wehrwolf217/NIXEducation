--1. продукты, цена которых больше 80.00 и меньше или равно 150.00
SELECT * FROM products WHERE price > 80.00 and price <= 150.00;
--2. заказы совершенные после 01.10.2020 (поле created_at)
SELECT * FROM orders WHERE created_at > '01.10.2020';
--3. заказы полученные за первое полугодие 2020 года
SELECT * FROM orders WHERE created_at >= '01.01.2020' and created_at <'07.01.2020';
--4. подукты следующих категорий Category 7, Category 11, Category 18
SELECT * FROM products WHERE category_id = '7' or category_id = '11' or category_id = '18';
--5. незавершенные заказы по состоянию на 31.12.2020
SELECT * FROM orders WHERE created_at <= '31.12.2020' AND order_status_order_status_id = '2' OR order_status_order_status_id = '1' ORDER BY created_at;
--6. вывести все корзины, которые были созданы, но заказ так и не был оформлен.
SELECT * FROM carts WHERE carts.cart_id not in (SELECT carts_cart_id FROM orders);
