program main

    real :: a, b, c, x1, x2, D

    a = 1
    b = 3
    c = 2

    if(a == 0) then
        x1 = -c/b
    else
        D = b**2-4*a*c
        if(D < 0) then
            print *, 'there is no real solution'
        else if(D == 0) then
            x1 = -b/2/a
            print *, x1
        else
            x1 = (-b + sqrt(D))/2/a
            x2 = (-b - sqrt(D))/2/a
            print *, x1
            print *, x2
        end if
    
    end if

end program main