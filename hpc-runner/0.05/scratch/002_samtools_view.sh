#!/bin/bash
#
#SBATCH --share
#SBATCH --job-name=002_samtools_view
#SBATCH --output=/scratch/gencore/nov_dalma_training/resequencing/hpc-runner/0.05/logs/2016-11-06-hpcrunner_logs/002_samtools_view.log
#SBATCH --partition=serial
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=10GB
#SBATCH --time=01:00:00
#SBATCH --array=2-2
#SBATCH --dependency=afterok:24590

module load gencore gencore_dev gencore_variant_detection/1.0
cd /scratch/gencore/nov_dalma_training/resequencing
hpcrunner.pl execute_array \
	--procs 1 \
	--outdir /scratch/gencore/nov_dalma_training/resequencing/hpc-runner/0.05/scratch \
	--logname 002_samtools_view \
	--process_table /scratch/gencore/nov_dalma_training/resequencing/hpc-runner/0.05/logs/2016-11-06-hpcrunner_logs/001-task_table.md \
	--metastr '{"job_counter":"002","total_batches":20,"commands":1,"total_jobs":20,"jobname":"samtools_view","total_processes":20,"array_end":"2","array_start":"2","batch":"002"}' \
	--job_plugins Blog,Blog \
	--version 0.05