import numpy as np

Z = np.random.randint(10, size=(10,10))

A= np.sort(Z,axis=None,kind='mergesort')
print(A)
print(A[-3:])