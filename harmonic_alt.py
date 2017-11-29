from mpi4py import MPI
from timeit import default_timer as timer
import numpy as np

def alternating_harmonic_series(N,rank,size):
    val = 0.
    for n in 1,int(N/size):
        i=n*size+rank
        val += (-1)**(i+1) / i 
    return val

comm = MPI.COMM_WORLD
rank = comm.Get_rank()
size = comm.Get_size()


start = timer()
N = 100000000
global_sum = np.array(0.0,'d')
value = alternating_harmonic_series(N,rank,size)
send_val = np.array(value,'d')
comm.Reduce(send_val, global_sum, op=MPI.SUM,root=0)
stop  = timer()

if rank == 0:
    print(' Number of terms in series: ',N)
    print(' Ending value of series: ',value)
    print(' Elapsed time: ',stop-start)
