test_list = [1, 2, 3, 4, 5, 6, 7, 8]
n = 6


def split_func(some_list, num_of_parts):
    return [some_list[i::num_of_parts] for i in range(num_of_parts)]
