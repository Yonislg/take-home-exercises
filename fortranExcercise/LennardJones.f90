program main
    implicit none

    integer, parameter :: N = 2
    real, dimension(3,N) :: positions
    real, dimension(3,N) :: potential
    real, dimension(3,N) :: forces
    real, dimension(3,N) :: velocity
    !real :: Force, LenJ
    real, parameter :: timestep = 0.1
    integer :: i

    call random_number(positions)
    call random_number(velocity)
    !print *,positions
    do i = 1,N 
        print "(3(f6.3, 2x))", positions(:,i)
    end do

    call state(positions,potential,forces,N)

    do i = 1, 5
        print *, "time is:"
        print "(f4.2)", timestep*i
        call advancing(positions,forces,N,velocity,timestep)
        call state(positions,potential,forces,N)
    end do

contains
    
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

    subroutine state(positions,potential,forces,N)

        integer, intent(in) :: N
        real, intent(in), dimension(3,N) :: positions
        real, intent(out), dimension(N) :: potential
        real, intent(out), dimension(3,N) :: forces
        !real :: Force, LenJ
        integer :: i,j,k
        real, dimension(3) :: r_vec
        real :: d

        do i = 1,N 
            do k = 1,N
                if(k/=i) then
                    r_vec = positions(:,i)-positions(:,k)
                    d = magnitude(r_vec)
                    potential(i) = potential(i) + LenJ(d)
                    do j = 1,3                                    
                        forces(j,i) = forces(j,i) + Force(d)/sqrt(d)*r_vec(j)
                    end do
                end if
            end do
        end do

        print *, "Potential"
        do i = 1,N 
            print "(3(e8.2, 2x))", potential(:,i)
        end do

        print *, "Force"
        do i = 1,N 
            print "(3(e8.2, 2x))", forces(:,i)
        end do

    end subroutine

    subroutine advancing(positions,forces,N,velocity,timestep)

        integer, intent(in) :: N
        real, intent(inout), dimension(3,N) :: positions
        real, intent(inout), dimension(3,N) :: velocity
        real, intent(in), dimension(3,N) :: forces
        real, intent(in) :: timestep
        !real :: Force, LenJ, timestep
        integer :: i,j

        do i = 1,N
            do j = 1,3
                positions(i,j) = positions(i,j) + velocity(i,j)*timestep 
                velocity(i,j) = velocity(i,j) + forces(i,j)*timestep ! assuming mass = 1 
            end do
        end do

        print *, "positions"
        do i = 1,N 
            print "(3(e8.2, 2x))", positions(:,i)
        end do

        print *, "velocity"
        do i = 1,N 
            print "(3(e8.2, 2x))", velocity(:,i)
        end do

    end subroutine

    function magnitude(p1) result(M)
        real, dimension(3) :: p1        ! 3D variable
        real :: M                           ! Magnitude

        p1 = p1**2
        M = sum(p1)
        M = sqrt(M)

    end function




end program main