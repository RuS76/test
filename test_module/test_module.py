

def test_module(data_in: int, data_out: list):
    data_out_into = data_out
    index = len(data_out_into)

    for data in data_out_into:
        if data == data_in:
            index = data_out_into.index(data) + 1
    #print ("depth", index)
    for i in range(index):
        temp = data_out_into[i]
        if (i == 0):
            data_out_into[i] = data_in
            #print("index", i, "data", data_out_into[i])
        else:
            data_out_into[i] = temp_
        temp_ = temp
        #print("index", i, "temps", temp_)
    return data_out_into


data_in_tamplate = [[1, 2, 1, 2, 1, 2, 1], [1, 2, 3, 4, 3, 2, 3, 4, 3, 4, 4]]

def test_module_tb():
    for template in data_in_tamplate:
        data_reset = [0, 0, 0, 0]
        data_out = test_module(0, data_reset)
        test_cnt = 0
        print("tests: ", test_cnt)
        for data_in in template:
            print("# test_cnt")
            data_out = test_module(data_in, data_out)
            print(data_out)
        test_cnt = test_cnt + 1


test_module_tb()