#!/bin/bash
#
#SBATCH --share
#SBATCH --job-name=015_gatk_realigner_target_creator
#SBATCH --output=/scratch/gencore/nov_dalma_training/resequencing/hpc-runner/0.05/logs/2016-11-06-hpcrunner_logs/015_gatk_realigner_target_creator.log
#SBATCH --partition=serial
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=10GB
#SBATCH --time=10:00:00
#SBATCH --array=15-15
#SBATCH --dependency=afterok:24597

module load gencore gencore_dev gencore_variant_detection/1.0
cd /scratch/gencore/nov_dalma_training/resequencing
hpcrunner.pl execute_array \
	--procs 1 \
	--outdir /scratch/gencore/nov_dalma_training/resequencing/hpc-runner/0.05/scratch \
	--logname 015_gatk_realigner_target_creator \
	--process_table /scratch/gencore/nov_dalma_training/resequencing/hpc-runner/0.05/logs/2016-11-06-hpcrunner_logs/001-task_table.md \
	--metastr '{"total_processes":20,"jobname":"gatk_realigner_target_creator","total_jobs":20,"array_start":"15","array_end":"15","batch":"015","job_counter":"015","total_batches":20,"commands":1}' \
	--job_plugins Blog,Blog,Blog,Blog,Blog,Blog,Blog,Blog,Blog,Blog,Blog,Blog,Blog,Blog,Blog \
	--version 0.05