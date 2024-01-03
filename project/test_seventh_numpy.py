import numpy as np
from seventh_numpy import  slide_average

def test_slide_average():
    Z = np.array([1,0,1,0,1,0,1])
    k = 2
    A = slide_average(Z,k)
    assert np.all(A*2==1)