program hello

use omp_lib

integer :: num_threads, thread_id

num_threads = omp_get_num_threads()

print *, num_threads

!$OMP PARALLEL PRIVATE (thread_id)

    thread_id = omp_get_thread_num()
    num_threads = omp_get_num_threads()
    print *, thread_id
    !print *, num_threads
    print *, "Hello OpenMP"

!$OMP END PARALLEL 

print *, num_threads

end program hello