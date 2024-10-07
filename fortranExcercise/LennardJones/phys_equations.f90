module phys_equations
implicit none

    function LenJ(r) result(V)
        real, parameter :: sigma = 0.1
        real, parameter :: epsilon = 0.1
        real, intent(in) :: r
        real :: V

        V = 4*epsilon*((sigma/r)**12-(sigma/r)**6)

    end function

    function Force(r) result(F)
        real, parameter :: sigma = 0.1
        real, parameter :: epsilon = 0.1
        real, intent(in) :: r
        real :: F

        F = -24*sigma*epsilon*(2*(sigma/r)**11 - (sigma/r)**5)

    end function

    function magnitude(p1) result(M)
        real, dimension(3) :: p1        ! 3D variable
        real :: M                           ! Magnitude

        p1 = p1**2
        M = sum(p1)
        M = sqrt(M)

    end function

end module