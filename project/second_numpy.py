import numpy as np 


A = np.random.randint(5, size = (3,3))
B = np.random.randint(5, size = (3,3))
#A = 2*np.identity(3)
print(A)
#print(A/2)
print(B)
print(np.matmul(A+B,-A/2))

def multiply_matrices(A,B):
    return np.matmul(A+B,-A/2)

