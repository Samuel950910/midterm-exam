program sum_to_n
  implicit none
  integer(kind=8) :: n, i, total

  write(*,'(A)', advance='no') 'Enter N: '
  read(*,*) n

  if (n < 1) then
    write(*,'(A)') 'Error: N must be a positive integer.'
    stop 1
  end if

  total = 0
  do i = 1, n
    total = total + i
  end do

  write(*,'(A,I0,A,I0)') 'Sum of 1 to ', n, ' = ', total
end program sum_to_n
