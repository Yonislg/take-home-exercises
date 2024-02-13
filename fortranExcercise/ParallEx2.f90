program main

   use iso_fortran_env

   use omp_lib
   implicit none


   integer, parameter :: knd = max(selected_real_kind(15), selected_real_kind(33))
   integer, parameter :: n = huge(1)/1000
   real(kind=knd), parameter :: pi_ref = 3.1415926535897932384626433832795028841971_knd
   DOUBLE PRECISION START, END 

   integer :: i
   real(kind=knd) :: f_int = 0.0, t
   

   START = omp_get_wtime() 
   do i = 0, n - 1
      t = 1.0 + real(i + 0.5, kind=knd)/n*9.0
      f_int = f_int + log(pi_ref*t)*sin(pi_ref*t)**2 + t
   end do
   END = omp_get_wtime() 

   print *, "integral is = ", f_int
   PRINT *, "Serial Code took", END - START, "seconds"

   f_int = 0
   START = omp_get_wtime() 
    !$OMP PARALLEL DO PRIVATE(t) REDUCTION(+:f_int)   
    do i = 0, n - 1
      t = 1.0 + real(i + 0.5, kind=knd)/n*9.0
      f_int = f_int + log(pi_ref*t)*sin(pi_ref*t)**2 + t
   end do
   !$OMP END PARALLEL DO
   END = omp_get_wtime()
   print *, "integral is = ", f_int
   PRINT *, "Parallel  Code took", END - START, "seconds" 


end program