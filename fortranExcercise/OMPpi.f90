program converge_pi

   use iso_fortran_env

   implicit none

   integer, parameter :: knd = max(selected_real_kind(15), selected_real_kind(33))
   !integer, parameter :: terms = 9
   integer :: terms
   real(kind=knd), parameter :: pi_ref = 3.1415926535897932384626433832795028841971_knd

   integer :: n
   real(kind=knd) :: pi = 2.0

   print *, 'KIND      : ', knd
   print *, 'PRECISION : ', precision(pi)
   print *, 'RANGE     : ', range(pi)

    print *, 'number of terms: '
    read *,terms

   !$OMP PARALLEL DO DEFAULT(none) REDUCTION(*:pi)
   do n = 1, terms
        pi = pi *  real(4*n*n,kind = knd) / real(4*n*n - 1,kind = knd)
   end do
   !$OMP END PARALLEL DO

   print *, ""
   print *, "Number of terms in the series : ", terms
   print *, "Computed value : ", pi
   print *, "Reference vaue : ", pi_ref
   print *, "ABS difference with reference : ", abs(pi_ref - pi)

end program converge_pi