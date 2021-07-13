from random import choice

test_list = [i for i in range(1000)]


cnt = 0
stop = 0
while stop != 777:
    if cnt == 100:
        raise Exception("ошибка с соответсвующим сообщением")
    else:
        stop = choice(test_list)
        # print(cnt, stop)
    cnt += 1
