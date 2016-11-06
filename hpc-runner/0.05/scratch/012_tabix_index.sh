#!/bin/bash
#
#SBATCH --share
#SBATCH --job-name=012_tabix_index
#SBATCH --output=/scratch/gencore/nov_dalma_training/resequencing/hpc-runner/0.05/logs/2016-11-06-hpcrunner_logs/012_tabix_index.log
#SBATCH --partition=serial
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=10GB
#SBATCH --time=01:00:00
#SBATCH --array=12-12
#SBATCH --dependency=afterok:24600

module load gencore gencore_dev gencore_variant_detection/1.0
cd /scratch/gencore/nov_dalma_training/resequencing
hpcrunner.pl execute_array \
	--procs 1 \
	--outdir /scratch/gencore/nov_dalma_training/resequencing/hpc-runner/0.05/scratch \
	--logname 012_tabix_index \
	--process_table /scratch/gencore/nov_dalma_training/resequencing/hpc-runner/0.05/logs/2016-11-06-hpcrunner_logs/001-task_table.md \
	--metastr '{"array_start":"12","array_end":"12","total_jobs":20,"total_processes":20,"jobname":"tabix_index","batch":"012","job_counter":"012","commands":1,"total_batches":20}' \
	--job_plugins Blog,Blog,Blog,Blog,Blog,Blog,Blog,Blog,Blog,Blog,Blog,Blog \
	--version 0.05