import numpy as np
from second_numpy import multiply_matrices

def test_multiply_matrices():
    A = -2*np.identity(3)
    C = np.random.randint(5, size = (3,3))
    B = C +2*np.identity(3)
    print(B)
    print(C)
    print(multiply_matrices(A,B))
    assert np.all(C== multiply_matrices(A,B))
