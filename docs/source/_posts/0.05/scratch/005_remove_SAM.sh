#!/bin/bash
#
#SBATCH --share
#SBATCH --job-name=005_remove_SAM
#SBATCH --output=/scratch/gencore/nov_dalma_training/resequencing/hpc-runner/0.05/logs/2016-11-06-hpcrunner_logs/005_remove_SAM.log
#SBATCH --partition=serial
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=1GB
#SBATCH --time=00:15:00
#SBATCH --array=5-5
#SBATCH --dependency=afterok:24591

module load gencore gencore_dev gencore_variant_detection/1.0
cd /scratch/gencore/nov_dalma_training/resequencing
hpcrunner.pl execute_array \
	--procs 1 \
	--outdir /scratch/gencore/nov_dalma_training/resequencing/hpc-runner/0.05/scratch \
	--logname 005_remove_SAM \
	--process_table /scratch/gencore/nov_dalma_training/resequencing/hpc-runner/0.05/logs/2016-11-06-hpcrunner_logs/001-task_table.md \
	--metastr '{"total_batches":20,"commands":1,"job_counter":"005","batch":"005","total_jobs":20,"total_processes":20,"jobname":"remove_SAM","array_start":"5","array_end":"5"}' \
	--job_plugins Blog,Blog,Blog,Blog,Blog \
	--version 0.05