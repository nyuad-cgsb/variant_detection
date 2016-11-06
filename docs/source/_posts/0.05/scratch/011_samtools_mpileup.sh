#!/bin/bash
#
#SBATCH --share
#SBATCH --job-name=011_samtools_mpileup
#SBATCH --output=/scratch/gencore/nov_dalma_training/resequencing/hpc-runner/0.05/logs/2016-11-06-hpcrunner_logs/011_samtools_mpileup.log
#SBATCH --partition=serial
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=10GB
#SBATCH --time=01:00:00
#SBATCH --array=11-11
#SBATCH --dependency=afterok:24595

module load gencore gencore_dev gencore_variant_detection/1.0
cd /scratch/gencore/nov_dalma_training/resequencing
hpcrunner.pl execute_array \
	--procs 1 \
	--outdir /scratch/gencore/nov_dalma_training/resequencing/hpc-runner/0.05/scratch \
	--logname 011_samtools_mpileup \
	--process_table /scratch/gencore/nov_dalma_training/resequencing/hpc-runner/0.05/logs/2016-11-06-hpcrunner_logs/001-task_table.md \
	--metastr '{"commands":1,"total_batches":20,"job_counter":"011","batch":"011","jobname":"samtools_mpileup","total_processes":20,"total_jobs":20,"array_start":"11","array_end":"11"}' \
	--job_plugins Blog,Blog,Blog,Blog,Blog,Blog,Blog,Blog,Blog,Blog,Blog \
	--version 0.05