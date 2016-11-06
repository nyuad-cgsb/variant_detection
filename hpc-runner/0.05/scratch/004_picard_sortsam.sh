#!/bin/bash
#
#SBATCH --share
#SBATCH --job-name=004_picard_sortsam
#SBATCH --output=/scratch/gencore/nov_dalma_training/resequencing/hpc-runner/0.05/logs/2016-11-06-hpcrunner_logs/004_picard_sortsam.log
#SBATCH --partition=serial
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=10GB
#SBATCH --time=01:00:00
#SBATCH --array=4-4
#SBATCH --dependency=afterok:24592

module load gencore gencore_dev gencore_variant_detection/1.0
cd /scratch/gencore/nov_dalma_training/resequencing
hpcrunner.pl execute_array \
	--procs 1 \
	--outdir /scratch/gencore/nov_dalma_training/resequencing/hpc-runner/0.05/scratch \
	--logname 004_picard_sortsam \
	--process_table /scratch/gencore/nov_dalma_training/resequencing/hpc-runner/0.05/logs/2016-11-06-hpcrunner_logs/001-task_table.md \
	--metastr '{"batch":"004","array_end":"4","array_start":"4","jobname":"picard_sortsam","total_processes":20,"total_jobs":20,"commands":1,"total_batches":20,"job_counter":"004"}' \
	--job_plugins Blog,Blog,Blog,Blog \
	--version 0.05