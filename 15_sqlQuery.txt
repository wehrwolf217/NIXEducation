--Вывести заказы, которые успешно доставлены и оплачены (возможно неправильно понял)
select * from orders where order_status_order_status_id = '3' or order_status_order_status_id='4';
