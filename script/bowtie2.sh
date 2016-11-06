#!/bin/bash

#
# Generated at: 2016-11-06T05:29:42
# This file was generated with the following options
#	--workflow	conf/resequencing-new.yml
#	--select_rules	bowtie2
#

#
# Samples: Sample_5
#
#
# Starting Workflow
#
#
# Global Variables:
#	resample: 0
#	wait: 0
#	auto_input: 1
#	coerce_paths: 1
#	auto_name: 1
#	indir: data/processed
#	outdir: data/analysis
#	min: 0
#	override_process: 0
#	rule_based: 1
#	verbose: 1
#	create_outdir: 1
#	analysis_dir: data/analysis
#	root: data/analysis
#	samtools: data/analysis/{$sample}/samtools
#	samtools_dir: data/analysis/{$sample}/samtools
#	picard: data/analysis/{$sample}/picard
#	picard_dir: data/analysis/{$sample}/picard
#	gatk: data/analysis/{$sample}/gatk
#	gatk_dir: {$self->root}/{$sample}/gatk
#	bowtie2: data/analysis/{$sample}/bowtie2
#	bowtie2_dir: {$self->root}/{$sample}/bowtie2
#	bowtie2_tmp_dir: {$self->analysis_dir}/{$sample}/bowtie2/tmp
#	freebayes: data/analysis/{$sample}/freebayes
#	freebayes_dir: {$self->root}/{$sample}/freebayes
#	bowtie2_reference: /scratch/Reference_Genomes/Public/Vertebrate_mammalian/Homo_sapiens/ENSEMBL-release-81-GRCh38/Homo_sapiens.GRCh38.dna.toplevel
#	reference: {$self->bowtie2_reference}.fa
#	library: 1
#	pcrModel: 0
#	goldenVcf: 0
#	ploidy: 2
#	file_rule: (Sample.*)$
#	by_sample_outdir: 1
#	find_by_dir: 1
#

#
#

# Starting bowtie2
#



#
# Variables 
# Indir: /scratch/gencore/nov_dalma_training/resequencing/data/processed
# Outdir: /scratch/gencore/nov_dalma_training/resequencing/data/analysis/bowtie2
# Local Variables:
#	INPUT: {$self->indir}/trimmomatic/{$sample}
#	OUTPUT: {$self->bowtie2_dir}/{$sample}_aligned.sam
#	before_meta: HPC DIRECTIVES
#
#HPC jobname=bowtie2
#HPC module=gencore gencore_dev gencore_variant_detection/1.0
#HPC mem=20GB
#HPC walltime=01:00:00
#HPC cpus_per_task=12
#HPC partition=serial
#HPC commands_per_node=1
#

#	outdir: /scratch/gencore/nov_dalma_training/resequencing/data/analysis/bowtie2
#	indir: /scratch/gencore/nov_dalma_training/resequencing/data/processed
#

#TASK tags=Sample_5
mkdir -p /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/bowtie2 && \
bowtie2 -p 12 -x /scratch/Reference_Genomes/Public/Vertebrate_mammalian/Homo_sapiens/ENSEMBL-release-81-GRCh38/Homo_sapiens.GRCh38.dna.toplevel \
-1 /scratch/gencore/nov_dalma_training/resequencing/data/processed/Sample_5/trimmomatic/Sample_5_read1_trimmomatic_1PE.gz \
-2 /scratch/gencore/nov_dalma_training/resequencing/data/processed/Sample_5/trimmomatic/Sample_5_read2_trimmomatic_2PE.gz \
-S /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/bowtie2/Sample_5_aligned.sam



#
# Ending bowtie2
#

#
# Ending Workflow
#
