import numpy as np
from numpy.lib.stride_tricks import sliding_window_view as slide

Z = np.random.randint(10, size=5)
k = 4

def slide_average(Z,k):
    A = slide(Z,k)
    return np.sum(A, axis = 1)/k

print(slide_average(Z,k))