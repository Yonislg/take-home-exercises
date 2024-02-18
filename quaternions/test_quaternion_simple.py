from quaternion import Quaternion, Qadd, Qmult, Qinv

import pytest

@pytest.fixture
def Afixt():
    return Quaternion(1,1,1,1)

@pytest.fixture
def Bfixt():
    return Quaternion(1,1,1,1)


def test_quaternion_example():
    A = Quaternion(1,1,1,1)
    assert A.a == 1
    assert A.i == 1
    #assert A.j == 2

def test_quaternion_addition(Afixt,Bfixt):
    A = Afixt
    B = Bfixt
    C = Qadd(A,B)
    D = Quaternion(2,2,2,2)
    assert C == D

def test_quaternion_multiplication(Afixt,Bfixt):
    A = Afixt
    B = Bfixt
    C = Qmult(A,B)
    D = Quaternion(-2,2,2,2)
    assert C == D   

def test_quaternion_invert(Afixt):
    A = Afixt
    C = Qinv(A)
    D = Quaternion(0.25,-0.25,-0.25,-0.25)
    assert C == D 

def test_quaternion_addition2(Afixt,Bfixt):
    A = Afixt
    B = Bfixt
    C = A + B
    D = Quaternion(2,2,2,2)
    assert C == D

def test_quaternion_multiplication2(Afixt,Bfixt):
    A = Afixt
    B = Bfixt
    C = A * B
    D = Quaternion(-2,2,2,2)
    assert C == D 