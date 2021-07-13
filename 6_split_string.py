my_string = "Денис, Олег, Вася, Петя,Дима,Женя"

result = my_string.split(',')
result = [i.strip() for i in result]
