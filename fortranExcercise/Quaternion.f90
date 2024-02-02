module qfuncs

    public quaternion

    type quaternion
        real :: a, i, j, k
        contains
            procedure :: Qadd,Qmult,Qinvert
    end type quaternion

contains

    function Qadd(Qin1,Qin2) result(Qout)
        class(quaternion), intent(in) :: Qin1,Qin2
        class(quaternion), allocatable :: Qout

        Qout%a = Qin1%a + Qin2%a
        Qout%i = Qin1%i + Qin2%i
        Qout%j = Qin1%j + Qin2%j
        Qout%k = Qin1%k + Qin2%k
        
    end function

    function Qmult(Qin1,Qin2) result(Qout)
        class(quaternion), intent(in) :: Qin1,Qin2
        class(quaternion), allocatable :: Qout

        Qout%a = Qin1%a * Qin2%a + Qin1%i * Qin2%i + Qin1%j * Qin2%j + Qin1%k * Qin2%k
        Qout%i = Qin1%a * Qin2%a - Qin1%i * Qin2%i - Qin1%j * Qin2%j + Qin1%k * Qin2%k
        Qout%j = Qin1%a * Qin2%a + Qin1%i * Qin2%i - Qin1%j * Qin2%j - Qin1%k * Qin2%k
        Qout%k = Qin1%a * Qin2%a - Qin1%i * Qin2%i + Qin1%j * Qin2%j - Qin1%k * Qin2%k
        
    end function

    function Qinvert(Qin) result(Qout)
        class(quaternion), intent(in) :: Qin
        class(quaternion), allocatable :: Qout

        Qout%a =   Qin%a / (Qin%a**2 + Qin%i**2 + Qin%a**j + Qin%k**2)
        Qout%i = - Qin%i / (Qin%a**2 + Qin%i**2 + Qin%a**j + Qin%k**2)
        Qout%j = - Qin%j / (Qin%a**2 + Qin%i**2 + Qin%a**j + Qin%k**2)
        Qout%k = - Qin%k / (Qin%a**2 + Qin%i**2 + Qin%a**j + Qin%k**2)
        
    end function

end module qfuncs

program main

    use qfuncs

    type(quaternion) :: A, B, C

    A = quaternion(1,2,1,2)
    B = quaternion(2,1,2,1)

    C = Qadd(A,B)
    print *,C

    C = Qmult(A,B)
    print *,C

    C = Qinvert(A)
    print *,C


end program