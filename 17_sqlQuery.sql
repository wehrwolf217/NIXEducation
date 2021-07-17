--1. среднюю сумму всех завершенных сделок
SELECT AVG(total) AS Averege_summ FROM orders WHERE order_status_order_status_id = 4;
--2. вывести максимальную сумму сделки за 3 квартал 2020
SELECT MAX(total) AS Max_total FROM orders WHERE created_at >= '01.07.2020' and created_at <= '30.09.2020';
