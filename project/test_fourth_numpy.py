import numpy as np

from fourth_numpy import Z31,Z32,Z33

def test_fourth_numpy():
    Z = np.random.randint(10, size=10)
    assert np.all(np.logical_and(Z**3==Z*Z*Z , Z**3==np.power(Z,3)))

def test_fourth_numpy2():
    Z = np.random.randint(10, size=10)
    assert np.all(np.logical_and(Z31(Z)==Z32(Z),Z33(Z)==Z32(Z)))