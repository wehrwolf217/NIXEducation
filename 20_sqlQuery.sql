--Вывести наименование группы товаров, общее количество по группе товаров в порядке убывания количества
SELECT category_title, filter.sum  
FROM categories, (SELECT category_id, sum(in_stock) FROM products GROUP BY category_id) filter 
WHERE categories.category_id = filter.category_id 
ORDER BY sum DESC;
