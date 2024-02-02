function magnitude(p1) result(M)
    real, dimension(3) :: p1        ! 3D variable
    real :: M                           ! Magnitude

    p1 = p1**2
    M = sum(p1)
    M = sqrt(M)

end function

function LenJ(r) result(V)
    real, parameter :: sigma = 0.1
    real, parameter :: epsilon = 0.1

    r = (sigma/r)**6
    V = 4*epsilon*(r**2-r)

end function

function Force(r) result(F)
    real, parameter :: sigma = 0.1
    real, parameter :: epsilon = 0.1

    F = -6*sigma*(2*(sigma/r)**11 - (sigma/r)**5)

end function

program main

    integer, parameter :: N = 2
    real, dimension(3,N) :: positions
    real, dimension(3,N) :: potential
    real, dimension(3,N) :: forces
    real, dimension(3,N) :: velocity
    real :: Force, LenJ
    real, parameter :: timestep = 0.1

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

end program main

subroutine state(positions,potential,forces,N)

    real, intent(inout), dimension(3,N) :: positions
    real, intent(out), dimension(3,N) :: potential
    real, intent(out), dimension(3,N) :: forces
    real :: Force, LenJ

    do i = 1,N 
        do j = 1,3
            potential(j,i) = 0.
            forces(j,i) = 0.
            do k = 1,N
                if(k/=i) then
                    potential(j,i) = potential(j,i) + LenJ(positions(j,i)-positions(j,k))
                    forces(j,i) = forces(j,i) + Force(positions(j,i)-positions(j,k))
                end if
            end do
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

    real, intent(inout), dimension(3,N) :: positions
    real, intent(inout), dimension(3,N) :: velocity
    real, intent(in), dimension(3,N) :: forces
    real :: Force, LenJ, timestep

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