!Write an array definition for complex elements in the range [-100,100]. 
!How many elements the array will have? 
!Write a constructor where the value of each element in the array is the square root of the corresponding index. 
!Use a compact constructor (implicit loop).

program main

    implicit none
    complex, dimension(-100:100) :: a
    integer :: i

    a = [ (sqrt(cmplx(i)), i = -100, 100) ]
    print *, a 


end program main