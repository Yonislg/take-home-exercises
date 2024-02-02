! Write a program that reads a file or randomly creates an array that stores the position of N particles in a 3D space. 
! Initially assume for all the particles have the same mass. 
! Write a subroutine to compute the center of mass of these particles.

program main

    integer, parameter :: N = 2
    real, dimension(N,3) :: positions
    real, dimension(3) :: average_position

    call random_number(positions)

    do i = 1,N 
        print "(3(f6.3, 2x))", positions(i,:)
    end do

    do i = 1,3
        average_position(i) = sum(positions(:,i))/N
    end do

    print *, 'average position is:'
    print "(3(f6.3, 2x))", average_position

    !type position
     !   real :: x, y, z
    !end type position


end program main