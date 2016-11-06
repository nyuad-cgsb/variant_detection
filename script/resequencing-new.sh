#!/bin/bash

#
# Generated at: 2016-11-06T05:50:15
# This file was generated with the following options
#	--workflow	conf/resequencing-new.yml
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
#	before_meta: HPC DIRECTIVES
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
#	before_meta: HPC DIRECTIVES
#
#HPC jobname=samtools_sort
#HPC deps=samtools_view
#HPC module=gencore gencore_dev gencore_variant_detection/1.0
#HPC mem=10GB
#HPC walltime=01:00:00
#HPC cpus_per_task=6
#HPC commands_per_node=1
#HPC partition=serial
#

#

#TASK tags=Sample_5
samtools sort -@ 6 /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/samtools/Sample_5_aligned.bam \
    > /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/samtools/Sample_5_aligned.sorted.bam && \
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
#	before_meta: HPC DIRECTIVES
#
#HPC jobname=samtools_mpileup
#HPC deps=samtools_sort
#HPC module=gencore gencore_dev gencore_variant_detection/1.0
#HPC mem=10GB
#HPC walltime=01:00:00
#HPC cpus_per_task=1
#HPC partition=serial
#HPC commands_per_node=1
#

#

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
#	OUTPUT: {$self->samtools_dir}/{$sample}_aligned.sorted.vcf.gz
#	create_outdir: 0
#	before_meta: HPC DIRECTIVES
#
#HPC jobname=tabix_index
#HPC deps=samtools_mpileup
#HPC module=gencore gencore_dev gencore_variant_detection/1.0
#HPC mem=10GB
#HPC walltime=01:00:00
#HPC cpus_per_task=1
#HPC commands_per_node=1
#HPC partition=serial
#

#	INPUT: {$self->samtools_dir}/{$sample}_aligned.sorted.vcf.gz
#

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
#	OUTPUT: {$self->samtools_dir}/{$sample}_aligned.sorted.vcf.stats
#	create_outdir: 0
#	before_meta: HPC DIRECTIVES
#
#HPC jobname=bcftools_stats
#HPC deps=tabix_index
#HPC module=gencore gencore_dev gencore_variant_detection/1.0
#HPC mem=1GB
#HPC walltime=00:25:00
#HPC cpus_per_task=1
#HPC commands_per_node=1
#HPC partition=serial
#

#	INPUT: {$self->samtools_dir}/{$sample}_aligned.sorted.vcf.gz
#

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
#	before_meta: HPC DIRECTIVES
#
#HPC jobname=bcftools_filter
#HPC deps=tabix_index
#HPC module=gencore gencore_dev gencore_variant_detection/1.0
#HPC mem=10GB
#HPC walltime=00:30:00
#HPC cpus_per_task=1
#HPC partition=serial
#HPC commands_per_node=1
#

#

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

# Starting remove_SAM
#



#
# Variables 
# Indir: /scratch/gencore/nov_dalma_training/resequencing/data/analysis/bcftools_filter
# Outdir: /scratch/gencore/nov_dalma_training/resequencing/data/analysis/remove_SAM
# Local Variables:
#	create_outdir: 0
#	before_meta: HPC DIRECTIVES
#
#HPC jobname=remove_SAM
#HPC deps=samtools_view
#HPC module=gencore gencore_dev gencore_variant_detection/1.0
#HPC mem=1GB
#HPC walltime=00:15:00
#HPC cpus_per_task=1
#HPC partition=serial
#HPC commands_per_node=12

#	outdir: /scratch/gencore/nov_dalma_training/resequencing/data/analysis/remove_SAM
#	indir: /scratch/gencore/nov_dalma_training/resequencing/data/analysis/bcftools_filter
#	OUTPUT: {$self->samtools_dir}/{$sample}_filteredQ10.aligned.sorted.vcf.gz
#	INPUT: {$self->samtools_dir}/{$sample}_filteredQ10.aligned.sorted.vcf.gz
#

#TASK tags=Sample_5
rm -rf /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/bowtie2/Sample_5_aligned.sam



#
# Ending remove_SAM
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
#	before_meta: HPC DIRECTIVES
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
#	OUTPUT: {$self->picard_dir}/{$sample}_csorted.cleaned.aligned.bam
#	before_meta: HPC DIRECTIVES
#
#HPC jobname=picard_sortsam
#HPC deps=picard_cleansam
#HPC module=gencore gencore_dev gencore_variant_detection/1.0
#HPC mem=10GB
#HPC walltime=01:00:00
#HPC cpus_per_task=1
#HPC partition=serial
#HPC commands_per_node=1
#

#	INPUT: {$self->picard_dir}/{$sample}_cleaned.aligned.bam
#

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

# Starting picard_collect_multiple_metrics
#



#
# Variables 
# Indir: /scratch/gencore/nov_dalma_training/resequencing/{$self->picard}
# Outdir: /scratch/gencore/nov_dalma_training/resequencing/{$self->picard}
# Local Variables:
#	indir: {$self->picard}
#	outdir: {$self->picard}
#	INPUT: {$self->picard_dir}/{$sample}_csorted.cleaned.aligned.bam
#	OUTPUT: {$self->picard_dir}/{$sample}_collmulmetr.csorted.cleaned.aligned
#	PROGRAM: PROGRAM=CollectAlignmentSummaryMetrics PROGRAM=CollectInsertSizeMetrics PROGRAM=QualityScoreDistribution PROGRAM=MeanQualityByCycle
#	before_meta: HPC DIRECTIVES
#
#HPC jobname=picard_collect_multiple_metrics
#HPC deps=picard_sortsam
#HPC module=gencore gencore_dev gencore_variant_detection/1.0
#HPC mem=10GB
#HPC walltime=01:00:00
#HPC cpus_per_task=1
#HPC partition=serial
#HPC commands_per_node=1
#

#

#TASK tags=Sample_5
picard -Xmx2g CollectMultipleMetrics \
    TMP_DIR=/scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/bowtie2/tmp \
    I=/scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/picard/Sample_5_csorted.cleaned.aligned.bam \
    O=/scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/picard/Sample_5_collmulmetr.csorted.cleaned.aligned \
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
#	INPUT: {$self->picard_dir}/{$sample}_collmulmetr.csorted.cleaned.aligned
#	OUTPUT: {$self->picard_dir}/{$sample}_withrg.csorted.cleaned.aligned.bam
#	ARGS: SORT_ORDER=coordinate RGID=1 RGLB={$self->library} RGPL=illumina RGPU=unit1 RGSM={$sample} RGCN=NYUAD
#	before_meta: HPC DIRECTIVES
#
#HPC jobname=picard_add_or_replace_groups
#HPC deps=picard_sortsam
#HPC module=gencore gencore_dev gencore_variant_detection/1.0
#HPC mem=10GB
#HPC walltime=01:00:00
#HPC cpus_per_task=1
#HPC partition=serial
#HPC commands_per_node=1
#

#

#TASK tags=Sample_5
picard -Xmx2g AddOrReplaceReadGroups \
    I=/scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/picard/Sample_5_csorted.cleaned.aligned.bam \
    O=/scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/picard/Sample_5_withrg.csorted.cleaned.aligned.bam \
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
#	INPUT: {$self->picard_dir}/{$sample}_withrg.csorted.cleaned.aligned.bam
#	OUTPUT: {$self->picard_dir}/{$sample}_withrg.csorted.cleaned.aligned.bam
#	before_meta: HPC DIRECTIVES
#
#HPC jobname=picard_bamindex
#HPC deps=picard_add_or_replace_groups
#HPC module=gencore gencore_dev gencore_variant_detection/1.0
#HPC mem=10GB
#HPC walltime=01:00:00
#HPC cpus_per_task=1
#HPC partition=serial
#HPC commands_per_node=1
#

#

#TASK tags=Sample_5
picard -Xmx2g BuildBamIndex \
    I=/scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/picard/Sample_5_withrg.csorted.cleaned.aligned.bam \
    TMP_DIR=/scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/bowtie2/tmp



#
# Ending picard_bamindex
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
#	INPUT: {$self->picard_dir}/{$sample}_withrg.csorted.cleaned.aligned.bam
#	OUTPUT: {$self->picard_dir}/{$sample}_mdup.withrg.csorted.cleaned.aligned.bam
#	metrics_file: {$self->picard_dir}/{$sample}_markDup_metrics_file.txt
#	before_meta: HPC DIRECTIVES
#
#HPC jobname=picard_markdups
#HPC deps=picard_add_or_replace_groups
#HPC module=gencore gencore_dev gencore_variant_detection/1.0
#HPC mem=10GB
#HPC walltime=01:00:00
#HPC cpus_per_task=1
#HPC partition=serial
#HPC commands_per_node=1
#

#

#TASK tags=Sample_5
picard -Xmx2g MarkDuplicates \
    M=/scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/picard/Sample_5_markDup_metrics_file.txt \
    I=/scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/picard/Sample_5_withrg.csorted.cleaned.aligned.bam \
    O=/scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/picard/Sample_5_mdup.withrg.csorted.cleaned.aligned.bam \
    MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=100 \
    TMP_DIR=/scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/bowtie2/tmp



#
# Ending picard_markdups
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
#	INPUT: {$self->picard_dir}/{$sample}_mdup.withrg.csorted.cleaned.aligned.bam
#	OUTPUT: {$self->gatk_dir}/{$sample}_realignment_targets.list
#	before_meta: HPC DIRECTIVES
#
#HPC jobname=gatk_realigner_target_creator
#HPC deps=picard_bamindex
#HPC module=gencore gencore_dev gencore_variant_detection/1.0
#HPC mem=10GB
#HPC walltime=10:00:00
#HPC cpus_per_task=1
#HPC partition=serial
#HPC commands_per_node=1
#

#

#TASK tags=Sample_5
mkdir -p /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/gatk && \
gatk -T RealignerTargetCreator \
    -R /scratch/Reference_Genomes/Public/Vertebrate_mammalian/Homo_sapiens/ENSEMBL-release-81-GRCh38/Homo_sapiens.GRCh38.dna.toplevel.fa \
    -I /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/picard/Sample_5_withrg.csorted.cleaned.aligned.bam \
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
#	OUTPUT: {$self->gatk_dir}/{$sample}_realigned.withrg.csorted.cleaned.aligned.bam
#	target_intervals: {$self->gatk_dir}/{$sample}_realignment_targets.list
#	before_meta: HPC DIRECTIVES
#
#HPC jobname=gatk_indel_realigner
#HPC deps=gatk_realigner_target_creator
#HPC module=gencore gencore_dev gencore_variant_detection/1.0
#HPC mem=10GB
#HPC walltime=10:00:00
#HPC cpus_per_task=1
#HPC partition=serial
#HPC commands_per_node=1
#

#

#TASK tags=Sample_5
mkdir -p /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/gatk && \
gatk -T IndelRealigner \
     -R /scratch/Reference_Genomes/Public/Vertebrate_mammalian/Homo_sapiens/ENSEMBL-release-81-GRCh38/Homo_sapiens.GRCh38.dna.toplevel.fa \
     -I /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/picard/Sample_5_withrg.csorted.cleaned.aligned.bam \
     -targetIntervals /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/gatk/Sample_5_realignment_targets.list \
     -o /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/gatk/Sample_5_realigned.withrg.csorted.cleaned.aligned.bam



#
# Ending gatk_indel_realigner
#


#
#

# Starting freebayes_vcf_calling
#



#
# Variables 
# Indir: /scratch/gencore/nov_dalma_training/resequencing/{$self->picard}
# Outdir: /scratch/gencore/nov_dalma_training/resequencing/{$self->freebayes}
# Local Variables:
#	indir: {$self->picard}
#	outdir: {$self->freebayes}
#	INPUT: {$self->gatk_dir}/{$sample}_realigned.withrg.csorted.cleaned.aligned.bam
#	OUTPUT: {$self->freebayes_dir}/{$sample}_freebayes_raw.vcf
#	before_meta: HPC DIRECTIVES
#
#HPC jobname=freebayes_vcf_calling
#HPC deps=gatk_indel_realigner
#HPC module=gencore gencore_dev gencore_variant_detection/1.0
#HPC mem=10GB
#HPC walltime=10:00:00
#HPC cpus_per_task=1
#HPC partition=serial
#HPC commands_per_node=1
#

#

#TASK tags=Sample_5
mkdir -p /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/freebayes && \
freebayes -f /scratch/Reference_Genomes/Public/Vertebrate_mammalian/Homo_sapiens/ENSEMBL-release-81-GRCh38/Homo_sapiens.GRCh38.dna.toplevel.fa \
  /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/gatk/Sample_5_realigned.withrg.csorted.cleaned.aligned.bam \
  > /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/freebayes/Sample_5_freebayes_raw.vcf



#
# Ending freebayes_vcf_calling
#


#
#

# Starting freebayes_vcffilter
#



#
# Variables 
# Indir: /scratch/gencore/nov_dalma_training/resequencing/{$self->freebayes}
# Outdir: /scratch/gencore/nov_dalma_training/resequencing/{$self->freebayes}
# Local Variables:
#	indir: {$self->freebayes}
#	outdir: {$self->freebayes}
#	INPUT: {$self->freebayes_dir}/{$sample}_freebayes_raw.vcf
#	OUTPUT: {$self->freebayes_dir}/{$sample}_filtered.freebayes.vcf
#	before_meta: HPC DIRECTIVES
#
#HPC jobname=freebayes_vcffilter
#HPC deps=freebayes_vcf_calling
#HPC module=gencore gencore_dev gencore_variant_detection/1.0
#HPC mem=10GB
#HPC walltime=05:00:00
#HPC cpus_per_task=1
#HPC partition=serial
#HPC commands_per_node=1
#

#

#TASK tags=Sample_5
mkdir -p /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/freebayes && \
vcffilter -f "QUAL > 1 & QUAL / AO > 10 & SAF > 0 & SAR > 0 & RPR > 1 & RPL > 1" \
  /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/freebayes/Sample_5_freebayes_raw.vcf > /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/freebayes/Sample_5_filtered.freebayes.vcf



#
# Ending freebayes_vcffilter
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
#	INPUT: {$self->freebayes_dir}/{$sample}_filtered.freebayes.vcf
#	OUTPUT: {$self->gatk_dir}/{$sample}_haplotype.realigned.withrg.csorted.cleaned.aligned.vcf
#	ARGS: -stand_emit_conf 10 -stand_call_conf 30 --genotyping_mode DISCOVERY
#	create_outdir: 0
#	before_meta: HPC DIRECTIVES
#
#HPC jobname=gatk_haplotypecaller
#HPC deps=gatk_indel_realigner
#HPC module=gencore gencore_dev gencore_variant_detection/1.0
#HPC mem=10GB
#HPC walltime=20:00:00
#HPC cpus_per_task=1
#HPC partition=serial
#HPC commands_per_node=1
#

#

#TASK tags=Sample_5
gatk -T HaplotypeCaller \
    -R /scratch/Reference_Genomes/Public/Vertebrate_mammalian/Homo_sapiens/ENSEMBL-release-81-GRCh38/Homo_sapiens.GRCh38.dna.toplevel.fa \
    -I /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/gatk/Sample_5_realigned.withrg.csorted.cleaned.aligned.bam \
    -stand_emit_conf 10 -stand_call_conf 30 --genotyping_mode DISCOVERY \
    -o /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/gatk/Sample_5_haplotype.realigned.withrg.csorted.cleaned.aligned.vcf



#
# Ending gatk_haplotypecaller
#


#
#

# Starting gatk_variant_filtration
#



#
# Variables 
# Indir: /scratch/gencore/nov_dalma_training/resequencing/{$self->picard}
# Outdir: /scratch/gencore/nov_dalma_training/resequencing/{$self->gatk}
# Local Variables:
#	indir: {$self->picard}
#	outdir: {$self->gatk}
#	INPUT: {$self->gatk_dir}/{$sample}_haplotype.realigned.withrg.csorted.cleaned.aligned.vcf
#	OUTPUT: {$self->gatk_dir}/{$sample}_my_snp_filter.haplotype.realigned.mdup.csorted.cleaned.aligned.vcf
#	ARGS_EXP: --filterExpression "QD '<' 2.0 || FS '>' 60.0 || MQ '<' 40.0 || MQRankSum '<' -12.5 || ReadPosRankSum '<' -8.0"
#	ARGS_NAME: --filterName "my_snp_filter"
#	create_outdir: 0
#	before_meta: HPC DIRECTIVES
#
#HPC jobname=gatk_variant_filtration
#HPC deps=gatk_haplotypecaller
#HPC module=gencore gencore_dev gencore_variant_detection/1.0
#HPC mem=20GB
#HPC walltime=20:00:00
#HPC cpus_per_task=1
#HPC partition=serial
#HPC commands_per_node=1
#

#

#TASK tags=Sample_5
gatk -T VariantFiltration \
    -R /scratch/Reference_Genomes/Public/Vertebrate_mammalian/Homo_sapiens/ENSEMBL-release-81-GRCh38/Homo_sapiens.GRCh38.dna.toplevel.fa \
    -I /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/gatk/Sample_5_haplotype.realigned.withrg.csorted.cleaned.aligned.vcf \
    --filterExpression "QD '<' 2.0 || FS '>' 60.0 || MQ '<' 40.0 || MQRankSum '<' -12.5 || ReadPosRankSum '<' -8.0" \
    --filterName "my_snp_filter" \
    -o /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/gatk/Sample_5_my_snp_filter.haplotype.realigned.mdup.csorted.cleaned.aligned.vcf



#
# Ending gatk_variant_filtration
#


#
#

# Starting remove_tmp
#



#
# Variables 
# Indir: /scratch/gencore/nov_dalma_training/resequencing/data/analysis/gatk_variant_filtration
# Outdir: /scratch/gencore/nov_dalma_training/resequencing/data/analysis/remove_tmp
# Local Variables:
#	create_outdir: 0
#	before_meta: HPC DIRECTIVES
#
#HPC jobname=remove_tmp
#HPC deps=gatk_variant_filtration
#HPC module=gencore gencore_dev gencore_variant_detection/1.0
#HPC mem=2GB
#HPC walltime=01:00:00
#HPC cpus_per_task=1
#HPC partition=serial
#HPC commands_per_node=12
#

#	outdir: /scratch/gencore/nov_dalma_training/resequencing/data/analysis/remove_tmp
#	indir: /scratch/gencore/nov_dalma_training/resequencing/data/analysis/gatk_variant_filtration
#	OUTPUT: {$self->gatk_dir}/{$sample}_my_snp_filter.haplotype.realigned.mdup.csorted.cleaned.aligned.vcf
#	INPUT: {$self->gatk_dir}/{$sample}_my_snp_filter.haplotype.realigned.mdup.csorted.cleaned.aligned.vcf
#

#TASK tags=Sample_5
#rm -rf /scratch/gencore/nov_dalma_training/resequencing/data/analysis/Sample_5/bowtie2/tmp



#
# Ending remove_tmp
#

#
# Ending Workflow
#
