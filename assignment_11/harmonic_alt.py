from mpi4py import MPI
from timeit import default_timer as timer
import numpy as np

def alternating_harmonic_series(N,rank,size):
    val = 0.
    for n in range(rank+1,N,size):
        val += (-1)**(n+1) / n 
    return val

comm = MPI.COMM_WORLD
rank = comm.Get_rank()
size = comm.Get_size()

start = timer()
N = 100000000
value = alternating_harmonic_series(N,rank,size)
stop  = timer()

value_sum = np.array(0.0,'d')
send_val = np.array(value,'d')
comm.Reduce(send_val, value_sum, op=MPI.SUM,root=0)

if rank == 0:
    print(' Number of terms in series: ',N)
    print(' Ending value of series: ',value_sum)
    print(' Elapsed time: ',stop-start)
