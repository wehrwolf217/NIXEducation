list_of_strings = ['high price', 'low price', 'some text']

result_list = [i.upper() if 'price' in i else i for i in list_of_strings]
