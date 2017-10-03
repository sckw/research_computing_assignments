! Assignment 5, Part 1

program MatrixMultiply

implicit none

! Declare variables
integer         					:: n, i, j, u
real(8),dimension(:,:), allocatable :: A, B, C
real(8)								:: time_start, time_end, time

! asks to input matrix size
write(*,*) 'Enter the matrix size, n'
read(*,*) n
write(*,*) 'The value of n is :', n

write(*,*) 'n', n

! create matrices A, B and C
allocate(A(n,n))
allocate(B(n,n))
allocate(C(n,n))

! assign all elements of matrices A and B to have the value 1
do i = 1,n
	do j = 1,n
		A(i,j) = 1
		B(i,j) = 1
	end do
end do

! matrix multiplication
call cpu_time(time_start)
do i = 1,n
	do j = 1,n
		C(i,j) = sum(A(i,:)*B(:,j))
	end do
end do
call cpu_time(time_end)

! use cpu_time() before and after do loops to get the time it takes to compute C = AB
write(*,*) 'Time to run section of code:' , time_end - time_start, 'seconds'

open(newunit=u, file='C.txt', status='replace')
write(u, *) C(1:10,1:5)
close(u)


end program MatrixMultiply