import numpy as np

arr = np.random.randint(2, size=(10,3))
print('a random 10x3 matrix')
print(arr)

print('Given a two dimensional array, how to extract unique rows?')
print(np.unique(arr,axis=0))

print('From a 10x3 matrix extract rows with unequal values')
#print(arr[0,:])
def extract_unequal(arr):
    ans = np.empty(shape=[0, 3],dtype='int8')
    for i in range(arr.shape[0]):
        #print(np.unique(arr[i,:], axis = 0))
        if len(np.unique(arr[i,:], axis = 0)) !=1:
            #print(arr[i,:])
            ans = np.append(ans,[arr[i,:]], axis=0)
    #        print(np.unique(arr,axis=0))
    return ans
print(extract_unequal(arr))
#for i in range(arr.shape[0]):
#    print(arr[i,:])

print('second method')
def extract_unequal2(arr):
    ans2 = np.logical_and.reduce(arr[:, 1:] == arr[:, :-1], axis = 1)
    return arr[~ans2]

print(extract_unequal2(arr))
