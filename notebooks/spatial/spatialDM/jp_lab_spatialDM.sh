#!/bin/bash
 
#SBATCH -o slurm_jupyter_%j.txt
#SBATCH -e slurm_error_%j.txt
#SBATCH --job-name=jp_lab_pert
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=6
#SBATCH --mail-type=ALL
#SBATCH --mail-user=sara.jimenez@helmholtz-munich.de
#SBATCH --mem-per-cpu=50G
#SBATCH --partition=cpu_p    
#SBATCH --qos=cpu_normal
#SBATCH --time=48:00:00

source $HOME/.bash_profile
 
conda deactivate

conda activate spatial_v2 

echo "Starting jupyter..."

jupyter-lab --port 8867 --no-browser --ip=0.0.0.0 --notebook-dir=/lustre/groups/ml01/workspace/sara.jimenez/spatial_pancreas/notebooks/spatial/spatialDM/
