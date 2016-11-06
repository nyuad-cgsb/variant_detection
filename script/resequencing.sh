#!/bin/bash

#
# Generated at: 2016-11-03T09:51:15
# This file was generated with the following options
#	--workflow	conf/resequencing.yml
#

#
# Samples: Sample_1, Sample_5
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
#	bowtie_tmp_dir: {$self->analysis_dir}/{$sample}/bowtie2/tmp
#	reference: /scratch/Reference_Genomes/Public/Vertebrate_mammalian/Homo_sapiens/ENSEMBL-release-81-GRCh38/Homo_sapiens.GRCh38.dna.toplevel.fa
#	bowtie2_reference: /scratch/Reference_Genomes/Public/Vertebrate_mammalian/Homo_sapiens/ENSEMBL-release-81-GRCh38/Homo_sapiens.GRCh38.dna.toplevel
#	library: 1
#	pcrModel: 0
#	goldenVcf: 1
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
#	before_meta: HPC THINGS
#
#HPC jobname=bowtie2
#HPC module=gencore gencore_dev gencore_variant_detection/1.0
#HPC mem=10GB
#HPC walltime=01:00:00
#HPC cpus_per_task=12
#HPC partition=serial
#

#	outdir: /scratch/gencore/nov_dalma_training/resequencing/data/analysis/bowtie2
#	indir: /scratch/gencore/nov_dalma_training/resequencing/data/processed
#

#INPUT=/scratch/gencore/nov_dalma_training/resequencing/data/processed/Sample_1/trimmomatic/Sample_1
#OUTPUT=/scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_1/bowtie2/Sample_1_aligned.sam
#TASK tags=Sample_1
mkdir -p /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_1/bowtie2 && \
bowtie2 -p 12 -x /scratch/Reference_Genomes/Public/Vertebrate_mammalian/Homo_sapiens/ENSEMBL-release-81-GRCh38/Homo_sapiens.GRCh38.dna.toplevel \
    -1 /scratch/gencore/nov_dalma_training/resequencing/data/processed/Sample_1/trimmomatic/Sample_1_read1_trimmomatic_1PE.gz \
    -2 /scratch/gencore/nov_dalma_training/resequencing/data/processed/Sample_1/trimmomatic/Sample_1_read2_trimmomatic_2PE.gz \
    -S /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_1/bowtie2/Sample_1_aligned.sam


#INPUT=/scratch/gencore/nov_dalma_training/resequencing/data/processed/Sample_5/trimmomatic/Sample_5
#OUTPUT=/scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/bowtie2/Sample_5_aligned.sam
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
#

# Starting samtools_view
#



#
# Variables 
# Indir: /scratch/gencore/nov_dalma_training/resequencing/data/analysis/bowtie2
# Outdir: /scratch/gencore/nov_dalma_training/resequencing/{$self->samtools}
# Local Variables:
#	outdir: {$self->samtools}
#	INPUT: {$self->bowtie2_dir}/{$sample}_aligned.sam
#	OUTPUT: {$self->samtools_dir}/{$sample}_aligned.bam
#	before_meta: HPC THINGS
#
#HPC jobname=samtools_view
#HPC deps=bowtie2
#HPC module=gencore gencore_dev gencore_variant_detection/1.0
#HPC mem=10GB
#HPC walltime=01:00:00
#HPC cpus_per_task=1
#HPC partition=serial
#HPC commands_per_node=1
#

#	indir: /scratch/gencore/nov_dalma_training/resequencing/data/analysis/bowtie2
#

#INPUT=/scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_1/bowtie2/Sample_1_aligned.sam
#OUTPUT=/scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_1/samtools/Sample_1_aligned.bam
#OUTDIR=/scratch/gencore/nov_dalma_training/resequencing/data/analysis/{$sample}/samtools
#TASK tags=Sample_1
mkdir -p /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_1/samtools && \
    samtools view -b -S /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_1/bowtie2/Sample_1_aligned.sam \
    > /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_1/samtools/Sample_1_aligned.bam


#INPUT=/scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/bowtie2/Sample_5_aligned.sam
#OUTPUT=/scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/samtools/Sample_5_aligned.bam
#OUTDIR=/scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_1/samtools
#TASK tags=Sample_5
mkdir -p /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/samtools && \
    samtools view -b -S /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/bowtie2/Sample_5_aligned.sam \
    > /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/samtools/Sample_5_aligned.bam



#
# Ending samtools_view
#


#
#

# Starting samtools_sort
#



#
# Variables 
# Indir: /scratch/gencore/nov_dalma_training/resequencing/{$self->samtools}
# Outdir: /scratch/gencore/nov_dalma_training/resequencing/{$self->samtools}
# Local Variables:
#	indir: {$self->samtools}
#	outdir: {$self->samtools}
#	INPUT: {$self->samtools_dir}/{$sample}_aligned.bam
#	OUTPUT: {$self->samtools_dir}/{$sample}_aligned.sorted.bam
#	before_meta: HPC THINGS
#
#HPC jobname=samtools_sort
#HPC deps=samtools_view
#HPC module=gencore gencore_dev gencore_variant_detection/1.0
#HPC mem=20GB
#HPC walltime=01:00:00
#HPC cpus_per_task=6
#HPC partition=serial
#HPC commands_per_node=1
#

#

#INPUT=/scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_1/samtools/Sample_1_aligned.bam
#OUTPUT=/scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_1/samtools/Sample_1_aligned.sorted.bam
#TASK tags=Sample_1
samtools sort -@ 6 /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_1/samtools/Sample_1_aligned.bam \
    -o /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_1/samtools/Sample_1_aligned.sorted.bam && \
    samtools index /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_1/samtools/Sample_1_aligned.sorted.bam


#INPUT=/scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/samtools/Sample_5_aligned.bam
#OUTPUT=/scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/samtools/Sample_5_aligned.sorted.bam
#TASK tags=Sample_5
samtools sort -@ 6 /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/samtools/Sample_5_aligned.bam \
    -o /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/samtools/Sample_5_aligned.sorted.bam && \
    samtools index /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/samtools/Sample_5_aligned.sorted.bam



#
# Ending samtools_sort
#


#
#

# Starting samtools_mpileup
#



#
# Variables 
# Indir: /scratch/gencore/nov_dalma_training/resequencing/{$self->samtools}
# Outdir: /scratch/gencore/nov_dalma_training/resequencing/{$self->samtools}
# Local Variables:
#	indir: {$self->samtools}
#	outdir: {$self->samtools}
#	INPUT: {$self->samtools_dir}/{$sample}_aligned.sorted.bam
#	OUTPUT: {$self->samtools_dir}/{$sample}_aligned.sorted.vcf.gz
#	before_meta: HPC THINGS
#
#HPC jobname=samtools_mpileup
#HPC deps=samtools_sort
#HPC module=gencore gencore_dev gencore_variant_detection/1.0
#HPC mem=10GB
#HPC walltime=24:00:00
#HPC cpus_per_task=1
#HPC partition=serial
#HPC commands_per_node=1
#

#

#INPUT=/scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_1/samtools/Sample_1_aligned.sorted.bam
#OUTPUT=/scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_1/samtools/Sample_1_aligned.sorted.vcf.gz
#TASK tags=Sample_1
samtools mpileup -ugf /scratch/Reference_Genomes/Public/Vertebrate_mammalian/Homo_sapiens/ENSEMBL-release-81-GRCh38/Homo_sapiens.GRCh38.dna.toplevel.fa \
    /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_1/samtools/Sample_1_aligned.sorted.bam | bcftools call -vmO z -o \
    /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_1/samtools/Sample_1_aligned.sorted.vcf.gz


#INPUT=/scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/samtools/Sample_5_aligned.sorted.bam
#OUTPUT=/scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/samtools/Sample_5_aligned.sorted.vcf.gz
#TASK tags=Sample_5
samtools mpileup -ugf /scratch/Reference_Genomes/Public/Vertebrate_mammalian/Homo_sapiens/ENSEMBL-release-81-GRCh38/Homo_sapiens.GRCh38.dna.toplevel.fa \
    /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/samtools/Sample_5_aligned.sorted.bam | bcftools call -vmO z -o \
    /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/samtools/Sample_5_aligned.sorted.vcf.gz



#
# Ending samtools_mpileup
#


#
#

# Starting tabix_index
#



#
# Variables 
# Indir: /scratch/gencore/nov_dalma_training/resequencing/{$self->samtools}
# Outdir: /scratch/gencore/nov_dalma_training/resequencing/{$self->samtools}
# Local Variables:
#	indir: {$self->samtools}
#	outdir: {$self->samtools}
#	INPUT: {$self->samtools_dir}/{$sample}_aligned.sorted.vcf.gz
#	OUTPUT: {$self->samtools_dir}/{$sample}_aligned.sorted.vcf.gz
#	create_outdir: 0
#	before_meta: HPC THINGS
#
#HPC jobname=tabix_index
#HPC deps=samtools_mpileup
#HPC module=gencore gencore_dev gencore_variant_detection/1.0
#HPC mem=5GB
#HPC walltime=01:00:00
#HPC cpus_per_task=1
#HPC partition=serial
#HPC commands_per_node=1
#

#

#TASK tags=Sample_1
tabix -p vcf /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_1/samtools/Sample_1_aligned.sorted.vcf.gz


#TASK tags=Sample_5
tabix -p vcf /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/samtools/Sample_5_aligned.sorted.vcf.gz



#
# Ending tabix_index
#


#
#

# Starting bcftools_stats
#



#
# Variables 
# Indir: /scratch/gencore/nov_dalma_training/resequencing/{$self->samtools}
# Outdir: /scratch/gencore/nov_dalma_training/resequencing/{$self->samtools}
# Local Variables:
#	indir: {$self->samtools}
#	outdir: {$self->samtools}
#	INPUT: {$self->samtools_dir}/{$sample}_aligned.sorted.vcf.gz
#	OUTPUT: {$self->samtools_dir}/{$sample}_aligned.sorted.vcf.stats
#	create_outdir: 0
#	before_meta: HPC THINGS
#
#HPC jobname=bcftools_stats
#HPC deps=tabix_index
#HPC module=gencore gencore_dev gencore_variant_detection/1.0
#HPC mem=10GB
#HPC walltime=01:00:00
#HPC cpus_per_task=1
#HPC partition=serial
#HPC commands_per_node=1
#

#

#TASK tags=Sample_1
bcftools stats -F /scratch/Reference_Genomes/Public/Vertebrate_mammalian/Homo_sapiens/ENSEMBL-release-81-GRCh38/Homo_sapiens.GRCh38.dna.toplevel.fa -s - /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_1/samtools/Sample_1_aligned.sorted.vcf.gz \
    > /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_1/samtools/Sample_1_aligned.sorted.vcf.stats


#TASK tags=Sample_5
bcftools stats -F /scratch/Reference_Genomes/Public/Vertebrate_mammalian/Homo_sapiens/ENSEMBL-release-81-GRCh38/Homo_sapiens.GRCh38.dna.toplevel.fa -s - /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/samtools/Sample_5_aligned.sorted.vcf.gz \
    > /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/samtools/Sample_5_aligned.sorted.vcf.stats



#
# Ending bcftools_stats
#


#
#

# Starting bcftools_filter
#



#
# Variables 
# Indir: /scratch/gencore/nov_dalma_training/resequencing/{$self->samtools}
# Outdir: /scratch/gencore/nov_dalma_training/resequencing/{$self->samtools}
# Local Variables:
#	indir: {$self->samtools}
#	outdir: {$self->samtools}
#	INPUT: {$self->samtools_dir}/{$sample}_aligned.sorted.vcf.stats
#	OUTPUT: {$self->samtools_dir}/{$sample}_filteredQ10.aligned.sorted.vcf.gz
#	create_outdir: 0
#	before_meta: HPC THINGS
#
#HPC jobname=bcftools_filter
#HPC deps=tabix_index
#HPC module=gencore gencore_dev gencore_variant_detection/1.0
#HPC mem=10GB
#HPC walltime=01:00:00
#HPC cpus_per_task=1
#HPC partition=serial
#HPC commands_per_node=1
#

#

#TASK tags=Sample_1
bcftools filter -O z \
    -o /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_1/samtools/Sample_1_filteredQ10.aligned.sorted.vcf.gz \
    -s LOWQUAL -i'%QUAL>10' \
    /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_1/samtools/Sample_1_aligned.sorted.vcf.gz


#TASK tags=Sample_5
bcftools filter -O z \
    -o /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/samtools/Sample_5_filteredQ10.aligned.sorted.vcf.gz \
    -s LOWQUAL -i'%QUAL>10' \
    /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/samtools/Sample_5_aligned.sorted.vcf.gz



#
# Ending bcftools_filter
#


#
#

# Starting picard_cleansam
#



#
# Variables 
# Indir: /scratch/gencore/nov_dalma_training/resequencing/{$self->samtools}
# Outdir: /scratch/gencore/nov_dalma_training/resequencing/{$self->picard}
# Local Variables:
#	indir: {$self->samtools}
#	outdir: {$self->picard}
#	INPUT: {$self->samtools_dir}/{$sample}_filteredQ10.aligned.sorted.vcf.gz
#	OUTPUT: {$self->picard_dir}/{$sample}_cleaned.aligned.bam
#	before_meta: HPC THINGS
#
#HPC jobname=picard_cleansam
#HPC deps=samtools_view
#HPC module=gencore gencore_dev gencore_variant_detection/1.0
#HPC mem=10GB
#HPC walltime=01:00:00
#HPC cpus_per_task=1
#HPC partition=serial
#HPC commands_per_node=1
#

#

#TASK tags=Sample_1
mkdir -p /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_1/picard && \
picard -Xmx2g CleanSam \
    INPUT=/scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_1/samtools/Sample_1_aligned.bam \
    O=/scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_1/picard/Sample_1_cleaned.aligned.bam \
    TMP_DIR=/scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_1/bowtie2/tmp


#TASK tags=Sample_5
mkdir -p /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/picard && \
picard -Xmx2g CleanSam \
    INPUT=/scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/samtools/Sample_5_aligned.bam \
    O=/scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/picard/Sample_5_cleaned.aligned.bam \
    TMP_DIR=/scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/bowtie2/tmp



#
# Ending picard_cleansam
#


#
#

# Starting picard_sortsam
#



#
# Variables 
# Indir: /scratch/gencore/nov_dalma_training/resequencing/{$self->picard}
# Outdir: /scratch/gencore/nov_dalma_training/resequencing/{$self->picard}
# Local Variables:
#	indir: {$self->picard}
#	outdir: {$self->picard}
#	INPUT: {$self->picard_dir}/{$sample}_cleaned.aligned.bam
#	OUTPUT: {$self->picard_dir}/{$sample}_csorted.cleaned.aligned.bam
#	before_meta: HPC THINGS
#
#HPC jobname=picard_sortsam
#HPC deps=picard_cleansam
#HPC module=gencore gencore_dev gencore_variant_detection/1.0
#HPC mem=10GB
#HPC walltime=24:00:00
#HPC cpus_per_task=1
#HPC partition=serial
#HPC commands_per_node=1
#

#

#TASK tags=Sample_1
picard -Xmx2g  SortSam \
    INPUT=/scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_1/picard/Sample_1_cleaned.aligned.bam \
    O=/scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_1/picard/Sample_1_csorted.cleaned.aligned.bam \
    SO=coordinate \
    TMP_DIR=/scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_1/bowtie2/tmp


#TASK tags=Sample_5
picard -Xmx2g  SortSam \
    INPUT=/scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/picard/Sample_5_cleaned.aligned.bam \
    O=/scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/picard/Sample_5_csorted.cleaned.aligned.bam \
    SO=coordinate \
    TMP_DIR=/scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/bowtie2/tmp



#
# Ending picard_sortsam
#


#
#

# Starting picard_markdups
#



#
# Variables 
# Indir: /scratch/gencore/nov_dalma_training/resequencing/{$self->picard}
# Outdir: /scratch/gencore/nov_dalma_training/resequencing/{$self->picard}
# Local Variables:
#	indir: {$self->picard}
#	outdir: {$self->picard}
#	INPUT: {$self->picard_dir}/{$sample}_csorted.cleaned.aligned.bam
#	OUTPUT: {$self->picard_dir}/{$sample}_mdup.csorted.cleaned.aligned.bam
#	metrics_file: {$self->picard_dir}/{$sample}_markDup_metrics_file.txt
#	before_meta: HPC THINGS
#
#HPC jobname=picard_markdups
#HPC deps=picard_sortsam
#HPC module=gencore gencore_dev gencore_variant_detection/1.0
#HPC mem=10GB
#HPC walltime=01:00:00
#HPC cpus_per_task=12
#HPC partition=serial
#HPC commands_per_node=1
#

#

#TASK tags=Sample_1
picard -Xmx2g MarkDuplicates \
    M=/scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_1/picard/Sample_1_markDup_metrics_file.txt \
    I=/scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_1/picard/Sample_1_csorted.cleaned.aligned.bam \
    O=/scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_1/picard/Sample_1_mdup.csorted.cleaned.aligned.bam \
    MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=100 \
    TMP_DIR=/scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_1/bowtie2/tmp


#TASK tags=Sample_5
picard -Xmx2g MarkDuplicates \
    M=/scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/picard/Sample_5_markDup_metrics_file.txt \
    I=/scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/picard/Sample_5_csorted.cleaned.aligned.bam \
    O=/scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/picard/Sample_5_mdup.csorted.cleaned.aligned.bam \
    MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=100 \
    TMP_DIR=/scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/bowtie2/tmp



#
# Ending picard_markdups
#


#
#

# Starting picard_collect_multiple_metrics
#



#
# Variables 
# Indir: /scratch/gencore/nov_dalma_training/resequencing/{$self->picard}
# Outdir: /scratch/gencore/nov_dalma_training/resequencing/{$self->picard}
# Local Variables:
#	indir: {$self->picard}
#	outdir: {$self->picard}
#	INPUT: {$self->picard_dir}/{$sample}_mdup.csorted.cleaned.aligned.bam
#	OUTPUT: {$self->picard_dir}/{$sample}_collmulmetr.mdup.csorted.cleaned.aligned
#	PROGRAM: PROGRAM=CollectAlignmentSummaryMetrics PROGRAM=CollectInsertSizeMetrics PROGRAM=QualityScoreDistribution PROGRAM=MeanQualityByCycle
#	before_meta: HPC THINGS
#
#HPC jobname=picard_collect_multiple_metrics
#HPC deps=picard_markdups
#HPC module=gencore gencore_dev gencore_variant_detection/1.0
#HPC mem=10GB
#HPC walltime=01:00:00
#HPC cpus_per_task=1
#HPC partition=serial
#HPC commands_per_node=1
#

#

#TASK tags=Sample_1
picard -Xmx2g CollectMultipleMetrics \
    TMP_DIR=/scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_1/bowtie2/tmp \
    I=/scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_1/picard/Sample_1_mdup.csorted.cleaned.aligned.bam \
    O=/scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_1/picard/Sample_1_collmulmetr.mdup.csorted.cleaned.aligned \
    PROGRAM=CollectAlignmentSummaryMetrics PROGRAM=CollectInsertSizeMetrics PROGRAM=QualityScoreDistribution PROGRAM=MeanQualityByCycle


#TASK tags=Sample_5
picard -Xmx2g CollectMultipleMetrics \
    TMP_DIR=/scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/bowtie2/tmp \
    I=/scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/picard/Sample_5_mdup.csorted.cleaned.aligned.bam \
    O=/scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/picard/Sample_5_collmulmetr.mdup.csorted.cleaned.aligned \
    PROGRAM=CollectAlignmentSummaryMetrics PROGRAM=CollectInsertSizeMetrics PROGRAM=QualityScoreDistribution PROGRAM=MeanQualityByCycle



#
# Ending picard_collect_multiple_metrics
#


#
#

# Starting picard_add_or_replace_groups
#



#
# Variables 
# Indir: /scratch/gencore/nov_dalma_training/resequencing/{$self->picard}
# Outdir: /scratch/gencore/nov_dalma_training/resequencing/{$self->picard}
# Local Variables:
#	indir: {$self->picard}
#	outdir: {$self->picard}
#	INPUT: {$self->picard_dir}/{$sample}_collmulmetr.mdup.csorted.cleaned.aligned
#	OUTPUT: {$self->picard_dir}/{$sample}_withrg.mdup.csorted.cleaned.aligned.bam
#	ARGS: SORT_ORDER=coordinate RGID=1 RGLB={$self->library} RGPL=illumina RGPU=unit1 RGSM={$sample} RGCN=NYUAD
#	before_meta: HPC THINGS
#
#HPC jobname=picard_add_or_replace_groups
#HPC deps=picard_markdups
#HPC module=gencore gencore_dev gencore_variant_detection/1.0
#HPC mem=10GB
#HPC walltime=01:00:00
#HPC cpus_per_task=1
#HPC partition=serial
#HPC commands_per_node=1
#

#

#TASK tags=Sample_1
picard -Xmx2g AddOrReplaceReadGroups \
    I=/scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_1/picard/Sample_1_mdup.csorted.cleaned.aligned.bam \
    O=/scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_1/picard/Sample_1_withrg.mdup.csorted.cleaned.aligned.bam \
    SORT_ORDER=coordinate RGID=1 RGLB=1 RGPL=illumina RGPU=unit1 RGSM=Sample_1 RGCN=NYUAD


#TASK tags=Sample_5
picard -Xmx2g AddOrReplaceReadGroups \
    I=/scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/picard/Sample_5_mdup.csorted.cleaned.aligned.bam \
    O=/scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/picard/Sample_5_withrg.mdup.csorted.cleaned.aligned.bam \
    SORT_ORDER=coordinate RGID=1 RGLB=1 RGPL=illumina RGPU=unit1 RGSM=Sample_5 RGCN=NYUAD



#
# Ending picard_add_or_replace_groups
#


#
#

# Starting picard_bamindex
#



#
# Variables 
# Indir: /scratch/gencore/nov_dalma_training/resequencing/{$self->picard}
# Outdir: /scratch/gencore/nov_dalma_training/resequencing/{$self->picard}
# Local Variables:
#	indir: {$self->picard}
#	outdir: {$self->picard}
#	INPUT: {$self->picard_dir}/{$sample}_withrg.mdup.csorted.cleaned.aligned.bam
#	OUTPUT: {$self->picard_dir}/{$sample}_withrg.mdup.csorted.cleaned.aligned.bam
#	before_meta: HPC THINGS
#
#HPC jobname=picard_bamindex
#HPC deps=picard_add_or_replace_groups
#HPC module=gencore gencore_dev gencore_variant_detection/1.0
#HPC mem=10GB
#HPC walltime=00:20:00
#HPC cpus_per_task=1
#HPC partition=serial
#HPC commands_per_node=1
#

#

#TASK tags=Sample_1
picard -Xmx2g BuildBamIndex \
    I=/scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_1/picard/Sample_1_withrg.mdup.csorted.cleaned.aligned.bam \
    TMP_DIR=/scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_1/bowtie2/tmp


#TASK tags=Sample_5
picard -Xmx2g BuildBamIndex \
    I=/scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/picard/Sample_5_withrg.mdup.csorted.cleaned.aligned.bam \
    TMP_DIR=/scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/bowtie2/tmp



#
# Ending picard_bamindex
#


#
#

# Starting remove_tmp
#



#
# Variables 
# Indir: /scratch/gencore/nov_dalma_training/resequencing/data/analysis/picard_bamindex
# Outdir: /scratch/gencore/nov_dalma_training/resequencing/data/analysis/remove_tmp
# Local Variables:
#	create_outdir: 0
#	before_meta: HPC THINGS
#
#HPC jobname=remove_tmp
#HPC deps=picard_bamindex
#HPC module=gencore gencore_dev gencore_variant_detection/1.0
#HPC mem=10GB
#HPC walltime=00:20:00
#HPC cpus_per_task=1
#HPC partition=serial
#HPC commands_per_node=1
#

#	outdir: /scratch/gencore/nov_dalma_training/resequencing/data/analysis/remove_tmp
#	indir: /scratch/gencore/nov_dalma_training/resequencing/data/analysis/picard_bamindex
#	OUTPUT: {$self->picard_dir}/{$sample}_withrg.mdup.csorted.cleaned.aligned.bam
#	INPUT: {$self->picard_dir}/{$sample}_withrg.mdup.csorted.cleaned.aligned.bam
#

#TASK tags=Sample_1
rm -rf /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_1/bowtie2/tmp


#TASK tags=Sample_5
rm -rf /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/bowtie2/tmp



#
# Ending remove_tmp
#


#
#

# Starting gatk_realigner_target_creator
#



#
# Variables 
# Indir: /scratch/gencore/nov_dalma_training/resequencing/{$self->picard}
# Outdir: /scratch/gencore/nov_dalma_training/resequencing/{$self->gatk}
# Local Variables:
#	indir: {$self->picard}
#	outdir: {$self->gatk}
#	INPUT: {$self->picard_dir}/{$sample}_withrg.mdup.csorted.cleaned.aligned.bam
#	OUTPUT: {$self->gatk_dir}/{$sample}_realignment_targets.list
#	create_outdir: 0
#	before_meta: HPC THINGS
#
#HPC jobname=gatk_realigner_target_creator
#HPC deps=picard_bamindex
#HPC module=gencore gencore_dev gencore_variant_detection/1.0
#HPC mem=10GB
#HPC walltime=01:00:00
#HPC cpus_per_task=1
#HPC partition=serial
#HPC commands_per_node=1
#

#

#TASK tags=Sample_1
mkdir -p /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_1/gatk && \
gatk \
    -T RealignerTargetCreator \
    -R /scratch/Reference_Genomes/Public/Vertebrate_mammalian/Homo_sapiens/ENSEMBL-release-81-GRCh38/Homo_sapiens.GRCh38.dna.toplevel.fa \
    -I /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_1/picard/Sample_1_withrg.mdup.csorted.cleaned.aligned.bam \
    -o /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_1/gatk/Sample_1_realignment_targets.list


#TASK tags=Sample_5
mkdir -p /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/gatk && \
gatk \
    -T RealignerTargetCreator \
    -R /scratch/Reference_Genomes/Public/Vertebrate_mammalian/Homo_sapiens/ENSEMBL-release-81-GRCh38/Homo_sapiens.GRCh38.dna.toplevel.fa \
    -I /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/picard/Sample_5_withrg.mdup.csorted.cleaned.aligned.bam \
    -o /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/gatk/Sample_5_realignment_targets.list



#
# Ending gatk_realigner_target_creator
#


#
#

# Starting gatk_indel_realigner
#



#
# Variables 
# Indir: /scratch/gencore/nov_dalma_training/resequencing/{$self->picard}
# Outdir: /scratch/gencore/nov_dalma_training/resequencing/{$self->gatk}
# Local Variables:
#	indir: {$self->picard}
#	outdir: {$self->gatk}
#	INPUT: {$self->gatk_dir}/{$sample}_realignment_targets.list
#	OUTPUT: {$self->gatk_dir}/{$sample}_realigned.withrg.mdup.csorted.cleaned.aligned.bam
#	target_intervals: {$self->gatk_dir}/{$sample}_realignment_targets.list
#	create_outdir: 0
#	before_meta: HPC THINGS
#
#HPC jobname=gatk_indel_realigner
#HPC deps=gatk_realigner_target_creator
#HPC module=gencore gencore_dev gencore_variant_detection/1.0
#HPC mem=10GB
#HPC walltime=01:00:00
#HPC cpus_per_task=1
#HPC partition=serial
#HPC commands_per_node=1
#

#

#TASK tags=Sample_1
gatk \
    -T IndelRealigner \
    -R /scratch/Reference_Genomes/Public/Vertebrate_mammalian/Homo_sapiens/ENSEMBL-release-81-GRCh38/Homo_sapiens.GRCh38.dna.toplevel.fa \
    -I /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_1/picard/Sample_1_withrg.mdup.csorted.cleaned.aligned.bam \
    -targetIntervals /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_1/gatk/Sample_1_realignment_targets.list \
    -o /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_1/gatk/Sample_1_realigned.withrg.mdup.csorted.cleaned.aligned.bam


#TASK tags=Sample_5
gatk \
    -T IndelRealigner \
    -R /scratch/Reference_Genomes/Public/Vertebrate_mammalian/Homo_sapiens/ENSEMBL-release-81-GRCh38/Homo_sapiens.GRCh38.dna.toplevel.fa \
    -I /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/picard/Sample_5_withrg.mdup.csorted.cleaned.aligned.bam \
    -targetIntervals /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/gatk/Sample_5_realignment_targets.list \
    -o /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/gatk/Sample_5_realigned.withrg.mdup.csorted.cleaned.aligned.bam



#
# Ending gatk_indel_realigner
#


#
#

# Starting gatk_haplotypecaller
#



#
# Variables 
# Indir: /scratch/gencore/nov_dalma_training/resequencing/{$self->picard}
# Outdir: /scratch/gencore/nov_dalma_training/resequencing/{$self->gatk}
# Local Variables:
#	indir: {$self->picard}
#	outdir: {$self->gatk}
#	INPUT: {$self->gatk_dir}/{$sample}_realigned.withrg.mdup.csorted.cleaned.aligned.bam
#	OUTPUT: {$self->gatk_dir}/{$sample}_haplotype.realigned.withrg.mdup.csorted.cleaned.aligned.vcf
#	ARGS: -stand_emit_conf 10 -stand_call_conf 30 --genotyping_mode DISCOVERY -pcrModel NONE
#	create_outdir: 0
#	before_meta: HPC THINGS
#
#HPC jobname=gatk_haplotypecaller
#HPC deps=gatk_indel_realigner
#HPC module=gencore gencore_dev gencore_variant_detection/1.0
#HPC mem=10GB
#HPC walltime=01:00:00
#HPC cpus_per_task=1
#HPC partition=serial
#HPC commands_per_node=1
#

#

#TASK tags=Sample_1
gatk \
    -T HaplotypeCaller \
    -R /scratch/Reference_Genomes/Public/Vertebrate_mammalian/Homo_sapiens/ENSEMBL-release-81-GRCh38/Homo_sapiens.GRCh38.dna.toplevel.fa \
    -I /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_1/gatk/Sample_1_realigned.withrg.mdup.csorted.cleaned.aligned.bam \
    -stand_emit_conf 10 -stand_call_conf 30 --genotyping_mode DISCOVERY -pcrModel NONE \
    -o /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_1/gatk/Sample_1_haplotype.realigned.withrg.mdup.csorted.cleaned.aligned.vcf


#TASK tags=Sample_5
gatk \
    -T HaplotypeCaller \
    -R /scratch/Reference_Genomes/Public/Vertebrate_mammalian/Homo_sapiens/ENSEMBL-release-81-GRCh38/Homo_sapiens.GRCh38.dna.toplevel.fa \
    -I /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/gatk/Sample_5_realigned.withrg.mdup.csorted.cleaned.aligned.bam \
    -stand_emit_conf 10 -stand_call_conf 30 --genotyping_mode DISCOVERY -pcrModel NONE \
    -o /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/gatk/Sample_5_haplotype.realigned.withrg.mdup.csorted.cleaned.aligned.vcf



#
# Ending gatk_haplotypecaller
#


#
#

# Starting gatk_variantfiltration
#



#
# Variables 
# Indir: /scratch/gencore/nov_dalma_training/resequencing/{$self->picard}
# Outdir: /scratch/gencore/nov_dalma_training/resequencing/{$self->gatk}
# Local Variables:
#	indir: {$self->picard}
#	outdir: {$self->gatk}
#	INPUT: {$self->gatk_dir}/{$sample}_haplotype.realigned.withrg.mdup.csorted.cleaned.aligned.vcf
#	OUTPUT: {$self->gatk_dir}/{$sample}_filtered.haplotype.realigned.withrg.mdup.csorted.cleaned.aligned.vcf
#	create_outdir: 0
#	before_meta: HPC THINGS
#
#HPC jobname=gatk_variantfiltration
#HPC deps=gatk_haplotypecaller
#HPC module=gencore gencore_dev gencore_variant_detection/1.0
#HPC mem=10GB
#HPC walltime=01:00:00
#HPC cpus_per_task=1
#HPC partition=serial
#HPC commands_per_node=1
#

#

#TASK tags=Sample_1
gatk \
    -T VariantFiltration \
    -R /scratch/Reference_Genomes/Public/Vertebrate_mammalian/Homo_sapiens/ENSEMBL-release-81-GRCh38/Homo_sapiens.GRCh38.dna.toplevel.fa \
    -I /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_1/gatk/Sample_1_haplotype.realigned.withrg.mdup.csorted.cleaned.aligned.vcf \
    --filterExpression "QD < 2.0 || FS > 60.0 || MQ < 40.0 || MQRankSum < -12.5 || ReadPosRankSum < -8.0" \
    --filterName "gatkfilter"
    -o /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_1/gatk/Sample_1_filtered.haplotype.realigned.withrg.mdup.csorted.cleaned.aligned.vcf


#TASK tags=Sample_5
gatk \
    -T VariantFiltration \
    -R /scratch/Reference_Genomes/Public/Vertebrate_mammalian/Homo_sapiens/ENSEMBL-release-81-GRCh38/Homo_sapiens.GRCh38.dna.toplevel.fa \
    -I /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/gatk/Sample_5_haplotype.realigned.withrg.mdup.csorted.cleaned.aligned.vcf \
    --filterExpression "QD < 2.0 || FS > 60.0 || MQ < 40.0 || MQRankSum < -12.5 || ReadPosRankSum < -8.0" \
    --filterName "gatkfilter"
    -o /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/gatk/Sample_5_filtered.haplotype.realigned.withrg.mdup.csorted.cleaned.aligned.vcf



#
# Ending gatk_variantfiltration
#


#
#

# Starting gatk_haplotypecaller_gvcf
#



#
# Variables 
# Indir: /scratch/gencore/nov_dalma_training/resequencing/{$self->picard}
# Outdir: /scratch/gencore/nov_dalma_training/resequencing/{$self->gatk}
# Local Variables:
#	indir: {$self->picard}
#	outdir: {$self->gatk}
#	INPUT: {$self->gatk_dir}/{$sample}_filtered.haplotype.realigned.withrg.mdup.csorted.cleaned.aligned.vcf
#	OUTPUT: {$self->gatk_dir}/{$sample}_haplotype.realigned.withrg.mdup.csorted.cleaned.aligned.g.vcf
#	ARGS: -ERC GVCF
#	create_outdir: 0
#	before_meta: HPC THINGS
#
#HPC jobname=gatk_haplotypecaller
#HPC deps=gatk_indel_realigner
#HPC module=gencore gencore_dev gencore_variant_detection/1.0
#HPC mem=20GB
#HPC walltime=05:00:00
#HPC cpus_per_task=1
#HPC partition=serial
#HPC commands_per_node=1
#

#

#TASK tags=Sample_1
gatk \
    -T HaplotypeCaller \
    -R /scratch/Reference_Genomes/Public/Vertebrate_mammalian/Homo_sapiens/ENSEMBL-release-81-GRCh38/Homo_sapiens.GRCh38.dna.toplevel.fa \
    -I /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_1/gatk/Sample_1_realigned.withrg.mdup.csorted.cleaned.aligned.bam \
    -ERC GVCF \
    -o /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_1/gatk/Sample_1_haplotype.realigned.withrg.mdup.csorted.cleaned.aligned.g.vcf


#TASK tags=Sample_5
gatk \
    -T HaplotypeCaller \
    -R /scratch/Reference_Genomes/Public/Vertebrate_mammalian/Homo_sapiens/ENSEMBL-release-81-GRCh38/Homo_sapiens.GRCh38.dna.toplevel.fa \
    -I /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/gatk/Sample_5_realigned.withrg.mdup.csorted.cleaned.aligned.bam \
    -ERC GVCF \
    -o /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/gatk/Sample_5_haplotype.realigned.withrg.mdup.csorted.cleaned.aligned.g.vcf



#
# Ending gatk_haplotypecaller_gvcf
#

#
# Ending Workflow
#
