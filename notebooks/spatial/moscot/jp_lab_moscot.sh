#!/bin/bash
 
#SBATCH -o slurm_jupyter_%j.txt
#SBATCH -e slurm_error_%j.txt
#SBATCH --job-name=jp_lab_long
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mail-type=ALL
#SBATCH --mail-user=sara.jimenez@helmholtz-munich.de
#SBATCH --mem-per-cpu=40G
#SBATCH --gres=gpu:1
#SBATCH --partition=gpu_p    
#SBATCH --qos=gpu_normal
#SBATCH --time=48:00:00

source $HOME/.bash_profile
 
conda deactivate

conda activate moscot_v2 

echo "Starting jupyter..."

jupyter-lab --port 8889 --no-browser --ip=0.0.0.0 --notebook-dir=/lustre/groups/ml01/workspace/sara.jimenez/spatial_pancreas/notebooks/spatial/moscot/
 
