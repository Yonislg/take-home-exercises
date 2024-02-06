! Write a code that computes the matrix multiplication
program main
    implicit none

    integer, parameter :: m = 3
    integer, parameter :: n = 2
    integer, parameter :: p = 3
    real, dimension(m,n) :: r1
    integer, dimension(m,n) :: a
    real, dimension(n,p) :: r2
    integer, dimension(n,p) :: b
    integer, dimension(m,p) :: c 

    !interface
    !    function matrix_multiplication(X,Y) result(Z)
    !        integer, dimension(:,:), intent(in) :: X,Y
    !        integer, dimension(:,:), allocatable :: Z! dimension(size(X,1),size(Y,2)) :: Z
    !    end function
    !end interface

    call random_number(r1)
    call random_number(r2)

    a = floor(10*r1)
    b = floor(10*r2)

    print *,"Matrix a"
    print "(2(I1, 2x))", a 
    print *,"Matrix b"
    print "(3(I1, 2x))", b 

    !c = matmul(a,b)
    c = matrix_multiplication(a,b)

    print *, "matrix c"
    print "(3(I2, 2x))", c 

    c = matmul(a,b)

    print *, "matrix c"
    print "(3(I2, 2x))", c 

contains

    function matrix_multiplication(a,b) result(c)
        integer, intent(in), dimension(:,:) :: a,b
        integer, dimension(:,:), allocatable :: c
        integer :: m, n, p, i, j, k

        m = size(a,1)
        n = size(a,2)
        p = size(b,2)

        allocate(c(m,p))

        c = 0

        print *, c

        if (n==size(b,1)) then
            do i = 1,m
                do j = 1, p
                    do k = 1, n
                        c(i,j) = c(i,j) + a(i,k)*b(k,j)
                    end do
                end do
            end do 
        else 
            print *, "arrays don't match"
        end if

    end function 


end program