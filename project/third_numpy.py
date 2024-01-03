import numpy as np

n = 5

X =np.random.randint(5, size=(3,3))
print(X)
sum1 =np.sum(X, axis =1)
print(sum1)
rows = sum1==n
print(rows)
ans = X[rows]
print(ans)

#rows = np.logical_and.reduce(np.sum(X,axis=1)==n)