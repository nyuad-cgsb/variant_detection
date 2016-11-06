#!/bin/bash
#
#SBATCH --share
#SBATCH --job-name=006_samtools_sort
#SBATCH --output=/scratch/gencore/nov_dalma_training/resequencing/hpc-runner/0.05/logs/2016-11-06-hpcrunner_logs/006_samtools_sort.log
#SBATCH --partition=serial
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=6
#SBATCH --ntasks-per-node=1
#SBATCH --mem=10GB
#SBATCH --time=01:00:00
#SBATCH --array=6-6
#SBATCH --dependency=afterok:24591

module load gencore gencore_dev gencore_variant_detection/1.0
cd /scratch/gencore/nov_dalma_training/resequencing
hpcrunner.pl execute_array \
	--procs 1 \
	--outdir /scratch/gencore/nov_dalma_training/resequencing/hpc-runner/0.05/scratch \
	--logname 006_samtools_sort \
	--process_table /scratch/gencore/nov_dalma_training/resequencing/hpc-runner/0.05/logs/2016-11-06-hpcrunner_logs/001-task_table.md \
	--metastr '{"total_batches":20,"commands":1,"job_counter":"006","batch":"006","total_processes":20,"jobname":"samtools_sort","total_jobs":20,"array_end":"6","array_start":"6"}' \
	--job_plugins Blog,Blog,Blog,Blog,Blog,Blog \
	--version 0.05