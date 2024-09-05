#!/bin/bash
 
#SBATCH -o slurm_jupyter_%j.txt
#SBATCH -e slurm_error_%j.txt
#SBATCH --job-name=JPLab
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=5G
#SBATCH --mail-type=ALL
#SBATCH --mail-user=sara.jimenez@helmholtz-munich.de
#SBATCH --partition=cpu_p    
#SBATCH --qos=cpu_normal
#SBATCH --time=24:00:00
 
source $HOME/.bash_profile
 
echo "Starting jupyter..."
 
conda deactivate
conda activate scvi-env
 
jupyter-lab --port 8889 --no-browser --ip=0.0.0.0 --notebook-dir=/lustre/groups/ml01/workspace/sara.jimenez/spatial_pancreas/notebooks/scrna/
 
