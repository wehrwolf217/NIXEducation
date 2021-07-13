# list1 = [2, 2, 3, 3, 4, 6, 1, 3, 3, 5, 5]
# list2 = [1, 3, 5]


# def list_exclude(list1, list2):
#     result = list1[:]
#     for i in list1:
#         if i in list2:
#             result.remove(i)
#     return result


def list_exclude(list1, list2):
    result = []
    for i in list1:
        if i not in list2:
            result.append(i)
        else:
            continue
    return result
