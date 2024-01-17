program randomArray
    implicit none

    integer :: n,i
    real, allocatable :: array1(:)
    integer, allocatable :: array2(:)
    integer, dimension(8) :: max8

    n = 10000
    allocate(array1(n))
    allocate(array2(n))
    call random_number(array1)
    array2 = FLOOR((n+1)*array1)
    !print *,array2
    do i = 1,8
        max8(i)=maxval(array2)
        array2(maxloc(array2)) = 0
    end do


    !print '(5(f8.6))',array1
    print *,max8
end program randomArray
