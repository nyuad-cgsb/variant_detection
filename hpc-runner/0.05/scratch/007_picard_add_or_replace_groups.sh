#!/bin/bash
#
#SBATCH --share
#SBATCH --job-name=007_picard_add_or_replace_groups
#SBATCH --output=/scratch/gencore/nov_dalma_training/resequencing/hpc-runner/0.05/logs/2016-11-06-hpcrunner_logs/007_picard_add_or_replace_groups.log
#SBATCH --partition=serial
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=10GB
#SBATCH --time=01:00:00
#SBATCH --array=7-7
#SBATCH --dependency=afterok:24593

module load gencore gencore_dev gencore_variant_detection/1.0
cd /scratch/gencore/nov_dalma_training/resequencing
hpcrunner.pl execute_array \
	--procs 1 \
	--outdir /scratch/gencore/nov_dalma_training/resequencing/hpc-runner/0.05/scratch \
	--logname 007_picard_add_or_replace_groups \
	--process_table /scratch/gencore/nov_dalma_training/resequencing/hpc-runner/0.05/logs/2016-11-06-hpcrunner_logs/001-task_table.md \
	--metastr '{"jobname":"picard_add_or_replace_groups","total_processes":20,"total_jobs":20,"array_start":"7","array_end":"7","batch":"007","job_counter":"007","commands":1,"total_batches":20}' \
	--job_plugins Blog,Blog,Blog,Blog,Blog,Blog,Blog \
	--version 0.05