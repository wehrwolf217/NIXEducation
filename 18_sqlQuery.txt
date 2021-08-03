Выведите имена и электронную почту потеницальных и существующих пользователей из города city 17
select potential_customers.name, potential_customers.email, users.first_name, users.email 
from potential_customers, users 
where potential_customers.city = 'city 17' and users.city = 'city 17';
