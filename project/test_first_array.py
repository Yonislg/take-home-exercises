import numpy as np
from first_array import extract_unequal, extract_unequal2

#arr = np.random.randint(2, size=(10,3))
#ans = extract_unequal(arr)

def test_first_array():
    #arr = np.random.randint(2, size=(10,3))
    #ans = extract_unequal(arr)
    arr = np.array([[1,1,1],
                    [1,1,1],
                    [1,2,3],
                    [2,2,2],
                    [2,2,2],
                    [2,3,4],
                    [3,3,3],
                    [3,3,3],
                    [3,4,4],
                    [0,1,2]])
    ans = np.array([[1,2,3],
                    [2,3,4],
                    [3,4,4],
                    [0,1,2]])
    assert np.all(extract_unequal(arr) == ans)

def test_first_array_2nd():
    arr = np.random.randint(2, size=(10,3))
    assert np.all(extract_unequal(arr) == extract_unequal2(arr))