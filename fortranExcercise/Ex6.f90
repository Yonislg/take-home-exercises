! Write the declaration of a real variable with a minimum of 12 decimal digits of precision and a range of 10^{−100} to 10^{100}
program main
    integer, parameter :: r12 = selected_real_kind(12,100)
    !print *, 'KIND      : ', kind(1.1_r12)
   !print *, 'PRECISION : ', precision(1.1_r12)
   !print *, 'RANGE     : ', range(1.1_r12)

   real(kind = r12) :: va
   print *, 'KIND      : ', kind(va)
   print *, 'PRECISION : ', precision(va)
   print *, 'RANGE     : ', range(va)
end program