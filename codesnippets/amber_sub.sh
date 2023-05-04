#!/usr/bin/env bash
#SBATCH --time=20:00:00
#SBATCH --job-name=QMMM_PBE
#SBATCH --partition=dumbledore
#SBATCH --mem=20g
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=20

module purge
module load amber/ambertools21
module load qchem/qchem-5.4.2-openmp

export QCSCRATCH=$PWD

sander -O -i QMMM.in -o QMMM_PBE.out -p complex.parm7 -c prod_4_long_1.ncrst -inf QMMM_PBE.mdinfo -r QMMM_PBE.ncrst -x QMMM_PBE.nc
