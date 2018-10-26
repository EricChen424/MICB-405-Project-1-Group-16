#!/bin/sh
mkdir ~/Project_1
mkdir ~/Project_1/1_FastQC_Output
mkdir ~/Project_1/2_BWA_Output
mkdir ~/Project_1/2_BWA_Output/index
mkdir ~/Project_1/2_BWA_Output/stats
mkdir ~/Project_1/3_SamTools_Output
mkdir ~/Project_1/4_BcfTools_Output
mkdir ~/Project_1/4_BcfTools_Output/raw
mkdir ~/Project_1/4_BcfTools_Output/filtered
mkdir ~/Project_1/4_BcfTools_Output/strict_filter
mkdir ~/Project_1/5_MSA_Output
mkdir ~/Project_1/5_MSA_Output/filtered
mkdir ~/Project_1/5_MSA_Output/strict_filter
mkdir ~/Project_1/6_Tree
mkdir ~/Project_1/6_Tree/filtered
mkdir ~/Project_1/6_Tree/strict_filter

cp /projects/micb405/resources/project_1/ref_genome.fasta ~/Project_1/

#2_1_bwa_index
bwa index -p ~/Project_1/2_BWA_Output/index/patient_0_index /projects/micb405/resources/project_1/ref_genome.fasta

#2_2_bwa_mem
for fastq in /projects/micb405/resources/project_1/*_1.fastq.gz;
do
	prefix=$(basename $fastq | sed 's/_1.fastq.gz//g')
	bwa mem -t 8 ~/Project_1/2_BWA_Output/index/patient_0_index \
	/projects/micb405/resources/project_1/$prefix\_1.fastq.gz \
	/projects/micb405/resources/project_1/$prefix\_2.fastq.gz \
	2>~/Project_1/2_BWA_Output/$prefix\.log.txt | \
	samtools view -bS - > ~/Project_1/2_BWA_Output/$prefix\.bam
done

#3_1_samtools_bam_sorting
for bam in ~/Project_1/2_BWA_Output/*.bam;
do
	prefix=$(basename $bam | sed 's/.bam//g')
	samtools sort ~/Project_1/2_BWA_Output/$prefix\.bam 1>~/Project_1/3_SamTools_Output/$prefix\.sorted.bam
done

#3_0_samtools_flagstat
for bam in ~/Project_1/3_SamTools_Output/*.sorted.bam;
do
	prefix=$(basename $bam | sed 's/.sorted.bam//g')
	samtools flagstat ~/Project_1/3_SamTools_Output/$prefix\.sorted.bam  > ~/Project_1/2_BWA_Output/stats/$prefix\.txt
done

#3_3_samtools_index
for sortedbam in ~/Project_1/3_SamTools_Output/*.sorted.bam;
do
	prefix=$(basename $sortedbam | sed 's/.sorted.bam//g')
	samtools index ~/Project_1/3_SamTools_Output/$prefix\.sorted.bam
done

#4_1_bcftools_variant_calling
for sortedbam in ~/Project_1/3_SamTools_Output/*.sorted.bam;
do
	prefix=$(basename $sortedbam | sed 's/.sorted.bam//g')
	bcftools mpileup -I --fasta-ref ~/Project_1/ref_genome.fasta \
	~/Project_1/3_SamTools_Output/$prefix\.sorted.bam | bcftools call -mv - \
	>~/Project_1/4_BcfTools_Output/raw/$prefix\.raw.vcf
done