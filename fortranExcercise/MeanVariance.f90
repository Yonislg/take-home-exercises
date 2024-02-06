program main
    implicit none

    integer :: N
    real, allocatable :: array1(:)
    real :: average, variance

    print *, 'array size: '
    read *,N
    
    allocate(array1(N))
    call random_number(array1)

    print "(f6.3, 2x)",array1
    call computeVar(array1,average,variance)

contains

    subroutine computeVar(X,average,variance)
        real, intent(in), dimension(:) :: X
        real, intent(out) :: average, variance
        average = sum(X)/size(X)
        variance = sum((X-average)**2)/size(X)
        print *,'average :'
        print "(f6.3, 2x)", average
        print *,"variance: "
        print "(f6.3, 2x)", variance

    end subroutine computeVar


end program