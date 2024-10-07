module LennardJones
    
    implicit none

contains 
    
    subroutine state(positions,potential,forces,N, sigma, epsilon)

        integer, intent(in) :: N
        real, intent(in) :: sigma, epsilon
        real, intent(in), dimension(3,N) :: positions
        real, intent(out), dimension(N) :: potential
        real, intent(out), dimension(3,N) :: forces
        integer :: i,j,k
        real, dimension(3) :: r_vec
        real :: d

        do i = 1,N 
            do k = 1,N
                if(k/=i) then
                    r_vec = positions(:,i)-positions(:,k)
                    d = magnitude(r_vec)
                    potential(i) = potential(i) + LenJ(d, sigma, epsilon)
                    do j = 1,3                                    
                        forces(j,i) = forces(j,i) + Force(d, sigma, epsilon)/sqrt(d)*r_vec(j)
                    end do
                end if
            end do
        end do

        print *, "Potential"
        do i = 1,N 
            print "((e8.2, 2x))", potential(i)
        end do

        print *, "Force"
        do i = 1,N 
            print "(3(e8.2, 2x))", forces(:,i)
        end do

    end subroutine

    subroutine advancing(positions,forces,velocity,timestep,N)

        integer, intent(in) :: N
        real, intent(inout), dimension(3,N) :: positions
        real, intent(inout), dimension(3,N) :: velocity
        real, intent(in), dimension(3,N) :: forces
        real, intent(in) :: timestep
        !real :: Force, LenJ, timestep
        integer :: i,j

        do j = 1,N
            do i = 1,3
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
  
    function LenJ(r, sigma, epsilon) result(V)
        
        real, intent(in) :: r, sigma, epsilon
        real :: V

        V = 4*epsilon*((sigma/r)**12-(sigma/r)**6)

    end function

    function Force(r, sigma, epsilon) result(F)
        real, intent(in) :: r, sigma, epsilon
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

end module LennardJones