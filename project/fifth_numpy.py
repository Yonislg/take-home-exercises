import numpy as np

Z = np.random.randint(10, size=(10,10))
n = 3

def nlargest(Z,n):
    A= np.sort(Z,axis=None,kind='mergesort')
    return A[-n:]

print(nlargest(Z,n))

#throwaway
print('testing ssh')