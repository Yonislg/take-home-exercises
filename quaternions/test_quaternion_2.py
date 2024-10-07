from quaternion import Quaternion, Qadd, Qmult, Qinv

import pytest

@pytest.fixture
def Afixt():
    return Quaternion(1,1,1,1)

@pytest.fixture
def Afixt2(Afixt):
    A = Afixt
    A.a = 0
    return A

@pytest.fixture
def Bfixt():
    return Quaternion(1,2,3,4)

@pytest.fixture
def Bfixt2(Bfixt):
    B = Bfixt
    B.a = 0
    return B

def test_quaternion_addition(Afixt,Bfixt):
    A = Afixt
    B = Bfixt
    C = Qadd(A,B)
    D = Quaternion(2,3,4,5)
    assert C == D

def test_quaternion_multiplication(Afixt,Bfixt):
    A = Afixt
    B = Bfixt
    C = Qmult(A,B)
    D = Qmult(B,A)
    assert C != D   
    assert C.a == D.a

def test_quaternion_addition2(Afixt,Bfixt):
    A = Afixt
    B = Bfixt
    C = A + B
    D = Quaternion(2,3,4,5)
    assert C == D

def test_quaternion_multiplication2(Afixt,Bfixt):
    A = Afixt
    B = Bfixt
    C = A * B
    D = B * A
    assert C.a == D.a
    assert C != D 

def test_multiplication_commutativity(Afixt2,Bfixt2):
    A = Afixt2
    B = Bfixt2
    C = A * B
    D = B * A
    assert C != D   
    assert C.a == D.a
    assert C.i == -D.i
    assert C.j == -D.j
    assert C.k == -D.k

# Iterative comparison of commutativity relationship
@pytest.mark.parametrize("Afixt3, Bfixt3, Ceq",[ 
    (Quaternion(0,1,1,1),Quaternion(0,2,3,4),[1,-1,-1,-1]),
    (Quaternion(1,0,1,1),Quaternion(1,0,3,4),[1,-1, 1, 1]),
    (Quaternion(1,1,0,1),Quaternion(1,2,0,4),[1, 1,-1, 1]),
    (Quaternion(1,1,1,0),Quaternion(1,2,3,0),[1, 1, 1,-1]),
])

def test_multiplication_commutativity2(Afixt3,Bfixt3,Ceq):
    A = Afixt3
    B = Bfixt3
    C = A * B
    D = B * A
    assert C != D   
    assert C.a == D.a * Ceq[0]
    assert C.i == D.i * Ceq[1]
    assert C.j == D.j * Ceq[2]
    assert C.k == D.k * Ceq[3]

def test_mult_Q1():
    assert Quaternion(1,2,3,4)*Quaternion(2,3,4,5) == Quaternion(4,57,7887,9)    

def test_scalar_add():
    A = Quaternion(1,1,1,1)
    B = Quaternion(2,1,1,1)
    assert A + 1 == B
    assert 1 + A == B
    assert B == Qadd(1,A)
    assert B == Qadd(A,1)

def test_scalar_multiply(Bfixt):
    assert Bfixt*2 == Bfixt + Bfixt
    assert 2*Bfixt == Bfixt + Bfixt
    assert Qmult(Bfixt,2) == Bfixt *2
    assert Qmult(2,Bfixt) == Bfixt *2