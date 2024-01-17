program uneqval

    integer :: i
    real, dimension(10,3) :: array1
    integer, dimension(10,3) :: array2
    call random_number(array1)
    array2 = FLOOR(6*array1)   
    print *,'random array'

    do i = 1,10
        print *, array2(i,:)
    end do

    print *,'unequal array'
    do i = 1,10
        if (array2(i,1)/=array2(i,2).or.array2(i,1)/=array2(i,3)) then
            print *, array2(i,:)
        end if
    end do


end program