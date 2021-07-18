--1. Вывести продукты, которые ни разу не попадали в корзину.
SELECT product_title
FROM products
EXCEPT ALL
SELECT products_product_id
FROM cart_product;

SELECT product_title FROM products
WHERE NOT EXISTS (
SELECT  FROM cart_product WHERE products_product_id = products.product_id);

SELECT p.product_title 
FROM products p
LEFT JOIN cart_product c ON c.products_product_id = p.product_id
WHERE c.products_product_id IS NULL;

--2. Вывести все продукты, которые так и не попали ни в 1 заказ. (но в корзину попасть могли).
-- наверное не правильно сумировать id но подругому не придумал как сгрупировать чтоб отсеиить пустые корзины (возможно стоило еще цену привязать)
SELECT p.product_title AS products_never_be_in_order
FROM products AS p 
LEFT JOIN cart_product AS cp ON cp.products_product_id = p.product_id 
LEFT JOIN orders AS o ON o.carts_cart_id = cp.carts_cart_id 
GROUP BY p.product_title 
HAVING SUM(o.carts_cart_id) IS NULL;

--3. Вывести топ 10 продуктов, которые добавляли в корзины чаще всего.	
SELECT p.product_title, COUNT(cp.carts_cart_id) AS times_add_to_cart 
FROM products AS p 
LEFT JOIN cart_product AS cp ON p.product_id = cp.products_product_id 
GROUP BY p.product_title ORDER BY COUNT(carts_cart_id) DESC LIMIT 10;

--4. Вывести топ 10 продуктов, которые не только добавляли в корзины, но и оформляли заказы чаще всего.
SELECT p.product_title, COUNT(o.carts_cart_id) AS times_ordered 
FROM products AS p 
LEFT JOIN cart_product AS cp ON p.product_id = cp.products_product_id 
LEFT JOIN orders AS o ON o.carts_cart_id = cp.carts_cart_id 
GROUP BY p.product_title ORDER BY COUNT(o.carts_cart_id) DESC LIMIT 10;

--5. Вывести топ 5 юзеров, которые потратили больше всего денег (total в заказе).
SELECT u.first_name, COALESCE(SUM(o.total), 0) AS order_sum 
FROM users AS u 
LEFT JOIN carts AS c ON c.users_user_id = u.user_id 
LEFT JOIN orders AS o ON o.carts_cart_id = c.cart_id 
GROUP BY u.first_name HAVING SUM(o.total)>0 
ORDER BY SUM(o.total) DESC LIMIT 5;

--6. Вывести топ 5 юзеров, которые сделали больше всего заказов (кол-во заказов)
-- на подобной выборке данных к сожалению на каждого покупателя тлько 1 покупка или же я что-то недопонял где считать количество покупок
SELECT u.first_name, COALESCE(COUNT(o.order_id), 0) AS num_of_orders 
FROM users AS u 
LEFT JOIN carts AS c ON c.users_user_id = u.user_id 
LEFT JOIN orders AS o ON o.carts_cart_id = c.cart_id 
GROUP BY u.first_name HAVING SUM(o.order_id)>0 ORDER BY num_of_orders LIMIT 5;

--7. Вывести топ 5 юзеров, которые создали корзины, но так и не сделали заказы.	
SELECT u.first_name, c.cart_id 
FROM users AS u 
LEFT JOIN carts AS c ON c.users_user_id = u.user_id 
LEFT JOIN orders AS o ON o.carts_cart_id = c.cart_id 
WHERE o.carts_cart_id IS NULL AND c.cart_id IS NOT NULL;






