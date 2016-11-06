#!/bin/bash
#
#SBATCH --share
#SBATCH --job-name=003_picard_cleansam
#SBATCH --output=/scratch/gencore/nov_dalma_training/resequencing/hpc-runner/0.05/logs/2016-11-06-hpcrunner_logs/003_picard_cleansam.log
#SBATCH --partition=serial
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=10GB
#SBATCH --time=01:00:00
#SBATCH --array=3-3
#SBATCH --dependency=afterok:24591

module load gencore gencore_dev gencore_variant_detection/1.0
cd /scratch/gencore/nov_dalma_training/resequencing
hpcrunner.pl execute_array \
	--procs 1 \
	--outdir /scratch/gencore/nov_dalma_training/resequencing/hpc-runner/0.05/scratch \
	--logname 003_picard_cleansam \
	--process_table /scratch/gencore/nov_dalma_training/resequencing/hpc-runner/0.05/logs/2016-11-06-hpcrunner_logs/001-task_table.md \
	--metastr '{"total_processes":20,"jobname":"picard_cleansam","total_jobs":20,"array_end":"3","array_start":"3","batch":"003","job_counter":"003","total_batches":20,"commands":1}' \
	--job_plugins Blog,Blog,Blog \
	--version 0.05