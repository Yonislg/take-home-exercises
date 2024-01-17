import numpy as np

n = 5

X =np.random.randint(5, size=(10,3))
print(X)

def multidraw(X,n):
    sum1 =np.sum(X, axis =1)
#print(sum1)
    rows = sum1==n
#print(rows)
    return X[rows]

ans = multidraw(X,n)
print(ans)

#rows = np.logical_and.reduce(np.sum(X,axis=1)==n)