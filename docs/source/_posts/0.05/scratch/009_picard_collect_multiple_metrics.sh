#!/bin/bash
#
#SBATCH --share
#SBATCH --job-name=009_picard_collect_multiple_metrics
#SBATCH --output=/scratch/gencore/nov_dalma_training/resequencing/hpc-runner/0.05/logs/2016-11-06-hpcrunner_logs/009_picard_collect_multiple_metrics.log
#SBATCH --partition=serial
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=10GB
#SBATCH --time=01:00:00
#SBATCH --array=9-9
#SBATCH --dependency=afterok:24593

module load gencore gencore_dev gencore_variant_detection/1.0
cd /scratch/gencore/nov_dalma_training/resequencing
hpcrunner.pl execute_array \
	--procs 1 \
	--outdir /scratch/gencore/nov_dalma_training/resequencing/hpc-runner/0.05/scratch \
	--logname 009_picard_collect_multiple_metrics \
	--process_table /scratch/gencore/nov_dalma_training/resequencing/hpc-runner/0.05/logs/2016-11-06-hpcrunner_logs/001-task_table.md \
	--metastr '{"job_counter":"009","total_batches":20,"commands":1,"array_start":"9","array_end":"9","total_processes":20,"jobname":"picard_collect_multiple_metrics","total_jobs":20,"batch":"009"}' \
	--job_plugins Blog,Blog,Blog,Blog,Blog,Blog,Blog,Blog,Blog \
	--version 0.05