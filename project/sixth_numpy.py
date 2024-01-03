import numpy as np



A = np.random.randint(10, size=(3,3))

rank = np.linalg.matrix_rank(A)
print(rank)