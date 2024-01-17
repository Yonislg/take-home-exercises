import numpy as np
from fifth_numpy import nlargest

def test_nlargest():
    n = 3
    Z = np.arange(0,10)
    assert np.all(nlargest(Z,n) == np.arange(7,10))