num = input("enter float number: ")


def round_func(some_float_num):
    result = float("{0:.2f}".format(float(some_float_num)))
    return result


print(round_func(num))

# не совсем понял зачем это нужно когда есть встроенные функции
print(round(3.145678, 2))
