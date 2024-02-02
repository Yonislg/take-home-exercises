subroutine toeplitz_decomp(X,X1,X2)
    integer, intent(in), dimension(:,:) :: X
    integer, intent(out), dimension(size(X,1),size(X,2)) :: X1, X2

    X1 = (X + transpose(X))/2
    X2 = (X - transpose(X))/2

end subroutine

program main
    integer, parameter :: N = 3
    real, dimension(N,N) :: r1
    integer, dimension(N,N) :: X, X1, X2

    interface
       subroutine toeplitz_decomp(X,X1,X2)
            integer, intent(in), dimension(:,:) :: X
            integer, intent(out), dimension(size(X,1),size(X,2)) :: X1, X2
        end subroutine
    end interface

    call random_number(r1)

    X = 2*floor(r1*5)

    call toeplitz_decomp(X,X1,X2)

    print *, "X"
    print "(3(I1, 2x))", X
    
    print *, "X1"
    print "(3(I2, 2x))", X1
    
    print *, "X2"
    print "(3(I2, 2x))", X2

end program