

class Quaternion:
    def __init__(self, a, i , j, k):
        self.a = a
        self.i = i
        self.j = j
        self.k = k

    def __eq__(self, other): 
        if not isinstance(other, Quaternion):
            # don't attempt to compare against unrelated types
            return NotImplemented

        return self.a == other.a and self.i == other.i and self.j == other.j and self.k == other.k 
    
    def __add__(self, other):
        if not isinstance(other, Quaternion):
            if isinstance(other, (float,int)):
               other = Quaternion(other,0,0,0)
            else:
                 # don't attempt to add unrelated types
                return NotImplemented
                 
        a = self.a + other.a
        i = self.i + other.i
        j = self.j + other.j
        k = self.k + other.k
        Qout = Quaternion(a,i,j,k)
        return Qout 
    
    def __radd__(self,other):
        if isinstance(other, (float,int)):
            other = Quaternion(other,0,0,0)
            return self.__add__(other)
        else:
            # don't attempt to reverse add non-scalars
            return NotImplemented
    
    def __mul__(self,other):
        if not isinstance(other, Quaternion):
            if isinstance(other, (float,int)):
               other = Quaternion(other,0,0,0)
            else:
                 # don't multiply wit unrelated types
                return NotImplemented
        Q1 = self
        Q2 = other
        a = Q1.a * Q2.a - Q1.i * Q2.i - Q1.j * Q2.j - Q1.k * Q2.k
        i = Q1.a * Q2.i + Q1.i * Q2.a + Q1.j * Q2.k - Q1.k * Q2.j
        j = Q1.a * Q2.j - Q1.i * Q2.k + Q1.j * Q2.a + Q1.k * Q2.i
        k = Q1.a * Q2.k + Q1.i * Q2.j - Q1.j * Q2.i + Q1.k * Q2.a
        Qout = Quaternion(a,i,j,k)
        return Qout
    
    def __rmul__(self,other):
        if isinstance(other, (float,int)):
            other = Quaternion(other,0,0,0)
            return self.__mul__(other)
        else:
            # don't attempt to reverse multiply non-scalars
            return NotImplemented

    def __str__(self):
         return f" {self.a} + {self.i} i + {self.j} j + {self.k} k"
    
    def __repr__(self):
        return (
            f"{type(self).__name__}"
            f'({self.a},'
            f'{self.i},'
            f"{self.j},"
            f'{self.k})'
        )

def Qadd(Q1, Q2):
    if not (isinstance(Q1, Quaternion) and isinstance(Q2, Quaternion)):
        if isinstance(Q1,(float,int)):
            Q1 = Quaternion(Q1,0,0,0)
        elif isinstance(Q2,(float,int)):
            Q2 = Quaternion(Q2,0,0,0)
        else:    
            # don't attempt to add unrelated types
            return NotImplemented

    a = Q1.a +Q2.a
    i = Q1.i +Q2.i
    j = Q1.j +Q2.j
    k = Q1.k +Q2.k

    Qout = Quaternion(a,i,j,k)

    return Qout 

def Qmult(Q1,Q2):
    if not (isinstance(Q1, Quaternion) and isinstance(Q2, Quaternion)):
        if isinstance(Q1,(float,int)):
            Q1 = Quaternion(Q1,0,0,0)
        elif isinstance(Q2,(float,int)):
            Q2 = Quaternion(Q2,0,0,0)
        else:   
            # don't attempt to multuply unrelated types
            return NotImplemented
    
    a = Q1.a * Q2.a - Q1.i * Q2.i - Q1.j * Q2.j - Q1.k * Q2.k
    i = Q1.a * Q2.i + Q1.i * Q2.a + Q1.j * Q2.k - Q1.k * Q2.j
    j = Q1.a * Q2.j - Q1.i * Q2.k + Q1.j * Q2.a + Q1.k * Q2.i
    k = Q1.a * Q2.k + Q1.i * Q2.j - Q1.j * Q2.i + Q1.k * Q2.a

    Qout = Quaternion(a,i,j,k)

    return Qout  

def Qinv(Q1):
    if not isinstance(Q1, Quaternion):
            # don't attempt to invert unrelated types
            return NotImplemented
    
    numerator = Q1.a**2 + Q1.i**2 + Q1.j**2 + Q1.k**2
    
    a =   Q1.a / numerator
    i = - Q1.i / numerator
    j = - Q1.j / numerator
    k = - Q1.k / numerator

    Qout = Quaternion(a,i,j,k)

    return Qout  
     
A = Quaternion(1,1,1,1)
B = Quaternion(1,1,1,1)
C = Qmult(A,B)

print(C)

print(C.__repr__)


