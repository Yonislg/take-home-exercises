program test1

    use lennardjones
    implicit none

        ! test parameters
    integer, parameter :: N = 2
    real, parameter :: timestep = 0.1
    integer, parameter:: steps = 5
    real, parameter :: sigma = 0.1   
    real, parameter :: epsilon = 0.1

    real, dimension(3,N) :: positions
    real, dimension(N) :: potential
    real, dimension(3,N) :: forces
    real, dimension(3,N) :: velocity
    

    integer :: i

    call random_number(positions)
    call random_number(velocity)
    !print *,positions
    do i = 1,N 
        print "(3(f6.3, 2x))", positions(:,i)
    end do

    call state(positions,potential,forces,N, sigma, epsilon)

    do i = 1, steps
        print *, "time is:"
        print "(f4.2)", timestep*i
        call advancing(positions,forces,velocity,timestep,N)
        call state(positions,potential,forces,N, sigma, epsilon)
    end do


end program