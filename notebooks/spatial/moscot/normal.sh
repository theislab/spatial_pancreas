#!/bin/bash
 
#SBATCH -o slurm_jupyter_%j.txt
#SBATCH -e slurm_error_%j.txt
#SBATCH --job-name=jp_lab_long
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mail-type=ALL
#SBATCH --mail-user=sara.jimenez@helmholtz-munich.de
#SBATCH --constraint=a100_80gb
#SBATCH --mem-per-cpu=40G
#SBATCH --gres=gpu:1
#SBATCH --partition=gpu_p    
#SBATCH --qos=gpu_normal
#SBATCH --time=24:00:00

source $HOME/.bash_profile
 
conda deactivate

conda activate moscot_v2 
#pip install jupyterlab
#pip install -U "jax[cuda12_pip]" -f https://storage.googleapis.com/jax-releases/jax_cuda_releases.html
#pip install git+https://github.com/theislab/moscot.git@main
#pip install git+https://github.com/scverse/squidpy@main

echo "Starting jupyter..."

jupyter-lab --port 8891 --no-browser --ip=0.0.0.0 --notebook-dir=/lustre/groups/ml01/workspace/sara.jimenez/spatial_pancreas/notebooks/spatial/moscot/
 
