import random
import time

randomlist = []
for i in range(0,100):
    n = random.randint(1,1000)
    randomlist.append(n)

goal = 537

def findnums(a1,goal):
    #a1 = sorted(a)
    for i1,n1 in enumerate(a1):
        n2 = goal - n1
        if n2 in a1[i1+1:]:
            return n1, n2

def binfindnums(a1,goal):
    #a1 = sorted(a)
    for i1,n1 in enumerate(a1):
        n2 = goal - n1
        low, high = i1, len(a1)-1
        while low <= high:
            mid = low + (high - low)//2

            if a1[mid] == n2:
                return n1,n2, i1, mid

            elif a1[mid] < n2:
                low = mid + 1

            else:
                high = mid - 1

def bracketfindnums(a1,goal):
    low,high = 0,len(a1)-1
    while a1[low] + a1[high] != goal:
        sum = a1[low] + a1[high]
        if (low >= high) or (high<0):
            return -1
        elif sum > goal:
            high -= 1
        elif sum < goal:
            low  += 1
    return a1[low], a1[high]

def setfindnums(a1,goal):
    #a1 = sorted(a)
    a2 = set(a1)
    #print(a2)
    for n1 in a2:
        n2 = goal - n1
        #print(n2)
        if n2 in a2:
            #print(a2)
            return n1, n2        
    
a1 = sorted(randomlist)

start = time.time()
n = findnums(a1,goal)
print(n)
end = time.time()
print(end - start)

start = time.time()
n = binfindnums(a1,goal)
print(n)
end = time.time()
print(end - start)

start = time.time()
n = bracketfindnums(a1,goal)
print(n)
end = time.time()
print(end - start)

start = time.time()
n = setfindnums(randomlist,goal)
print(n)
end = time.time()
print(end - start)
