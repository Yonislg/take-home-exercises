!Write a derived type appropriated for a point-like classical particle. 
!The particle has a mass and charge. 
!The derived type should be able to store the position and velocity (3D) of the particle.
!Write an example of a derived type constant for this particle.

program main

    implicit none

    type position
        real :: x, y, z
    end type position

    type velocity
        real :: x, y, z
    end type velocity

    type particle
        real            :: mass
        real            :: charge
        type(position)  :: position
        type(velocity)  :: velocity
    end type particle


    real, parameter :: m_p = 1.66E-27 !kg
    real, parameter :: q_p = 1.6E-19  !Coulomb

    type(particle) :: proton = particle(m_p,q_p,position(1.0,0.5,0.33),velocity(3.,2.,-4.))
    
    print *, 'mass        :',proton%mass,' kg'
    print *, 'position Z  :',proton%position%z
    print *, 'position Y  :',proton%position%y
    print *, 'velocity Z  :',proton%velocity%z


end program main