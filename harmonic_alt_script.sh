#!/bin/sh
#SBATCH --account=edu
#SBATCH --job-name=AlternatingSeries
#SBATCH -N 4
#SBATCH --exclusive
#SBATCH --time=10:00

source activate geo_scipy

mpirun -n 1 python harmonic_alt.py
mpirun -n 2 python harmonic_alt.py
mpirun -n 3 python harmonic_alt.py
mpirun -n 6 python harmonic_alt.py
mpirun -n 12 python harmonic_alt.py
mpirun -n 24 python harmonic_alt.py
mpirun -n 48 python harmonic_alt.py
mpirun -n 96 python harmonic_alt.py
