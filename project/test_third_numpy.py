import numpy as np
from third_numpy import multidraw

def test_multidraw():
    n = 5
    X = np.array([[1,2,3],
                  [2,3,4],
                  [1,1,3]])
    assert np.all(multidraw(X,n) == X[2,:])