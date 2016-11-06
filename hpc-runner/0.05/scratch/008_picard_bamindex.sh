#!/bin/bash
#
#SBATCH --share
#SBATCH --job-name=008_picard_bamindex
#SBATCH --output=/scratch/gencore/nov_dalma_training/resequencing/hpc-runner/0.05/logs/2016-11-06-hpcrunner_logs/008_picard_bamindex.log
#SBATCH --partition=serial
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=10GB
#SBATCH --time=01:00:00
#SBATCH --array=8-8
#SBATCH --dependency=afterok:24596

module load gencore gencore_dev gencore_variant_detection/1.0
cd /scratch/gencore/nov_dalma_training/resequencing
hpcrunner.pl execute_array \
	--procs 1 \
	--outdir /scratch/gencore/nov_dalma_training/resequencing/hpc-runner/0.05/scratch \
	--logname 008_picard_bamindex \
	--process_table /scratch/gencore/nov_dalma_training/resequencing/hpc-runner/0.05/logs/2016-11-06-hpcrunner_logs/001-task_table.md \
	--metastr '{"batch":"008","array_end":"8","array_start":"8","total_jobs":20,"jobname":"picard_bamindex","total_processes":20,"commands":1,"total_batches":20,"job_counter":"008"}' \
	--job_plugins Blog,Blog,Blog,Blog,Blog,Blog,Blog,Blog \
	--version 0.05