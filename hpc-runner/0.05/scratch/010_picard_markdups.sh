#!/bin/bash
#
#SBATCH --share
#SBATCH --job-name=010_picard_markdups
#SBATCH --output=/scratch/gencore/nov_dalma_training/resequencing/hpc-runner/0.05/logs/2016-11-06-hpcrunner_logs/010_picard_markdups.log
#SBATCH --partition=serial
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=10GB
#SBATCH --time=01:00:00
#SBATCH --array=10-10
#SBATCH --dependency=afterok:24596

module load gencore gencore_dev gencore_variant_detection/1.0
cd /scratch/gencore/nov_dalma_training/resequencing
hpcrunner.pl execute_array \
	--procs 1 \
	--outdir /scratch/gencore/nov_dalma_training/resequencing/hpc-runner/0.05/scratch \
	--logname 010_picard_markdups \
	--process_table /scratch/gencore/nov_dalma_training/resequencing/hpc-runner/0.05/logs/2016-11-06-hpcrunner_logs/001-task_table.md \
	--metastr '{"total_jobs":20,"jobname":"picard_markdups","total_processes":20,"array_end":"10","array_start":"10","batch":"010","job_counter":"010","commands":1,"total_batches":20}' \
	--job_plugins Blog,Blog,Blog,Blog,Blog,Blog,Blog,Blog,Blog,Blog \
	--version 0.05