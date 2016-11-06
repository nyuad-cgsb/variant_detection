#!/bin/bash
#
#SBATCH --share
#SBATCH --job-name=018_freebayes_vcffilter
#SBATCH --output=/scratch/gencore/nov_dalma_training/resequencing/hpc-runner/0.05/logs/2016-11-06-hpcrunner_logs/018_freebayes_vcffilter.log
#SBATCH --partition=serial
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=10GB
#SBATCH --time=05:00:00
#SBATCH --array=18-18
#SBATCH --dependency=afterok:24606

module load gencore gencore_dev gencore_variant_detection/1.0
cd /scratch/gencore/nov_dalma_training/resequencing
hpcrunner.pl execute_array \
	--procs 1 \
	--outdir /scratch/gencore/nov_dalma_training/resequencing/hpc-runner/0.05/scratch \
	--logname 018_freebayes_vcffilter \
	--process_table /scratch/gencore/nov_dalma_training/resequencing/hpc-runner/0.05/logs/2016-11-06-hpcrunner_logs/001-task_table.md \
	--metastr '{"job_counter":"018","total_batches":20,"commands":1,"array_start":"18","array_end":"18","jobname":"freebayes_vcffilter","total_processes":20,"total_jobs":20,"batch":"018"}' \
	--job_plugins Blog,Blog,Blog,Blog,Blog,Blog,Blog,Blog,Blog,Blog,Blog,Blog,Blog,Blog,Blog,Blog,Blog,Blog \
	--version 0.05