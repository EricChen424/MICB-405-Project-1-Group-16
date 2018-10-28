#!/bin/sh
mkdir ~/Project_1
mkdir ~/Project_1/1_FastQC_Output
mkdir ~/Project_1/2_BWA_Output
mkdir ~/Project_1/2_BWA_Output/index
mkdir ~/Project_1/2_BWA_Output/stats
mkdir ~/Project_1/2_BWA_Output/trim
mkdir ~/Project_1/2_BWA_Output/trim/fastqc
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
	bwa mem -t 8 -r 0.75 ~/Project_1/2_BWA_Output/index/patient_0_index \
	/projects/micb405/resources/project_1/$prefix\_1.fastq.gz \
	/projects/micb405/resources/project_1/$prefix\_2.fastq.gz \
	2>~/Project_1/2_BWA_Output/$prefix\.log.txt | \
	samtools view -bS - > ~/Project_1/2_BWA_Output/$prefix\.bam
done

#trimmomatic
trimmomatic PE -phred33 /projects/micb405/resources/project_1/Bat_1.fastq.gz \
/projects/micb405/resources/project_1/Bat_1.fastq.gz \
~/Project_1/2_BWA_Output/trim/Bat_1.fastq.gz \
~/Project_1/2_BWA_Output/trim/Bat_1_up.fastq.gz \
~/Project_1/2_BWA_Output/trim/Bat_2.fastq.gz \
~/Project_1/2_BWA_Output/trim/Bat_2_up.fastq.gz \
ILLUMINACLIP:NexteraPE-PE.fa:2:30:10

trimmomatic PE -phred33 /projects/micb405/resources/project_1/Patient_14_1.fastq.gz \
/projects/micb405/resources/project_1/Patient_14_2.fastq.gz \
~/Project_1/2_BWA_Output/trim/Patient_14_1.fastq.gz \
~/Project_1/2_BWA_Output/trim/Patient_14_1_up.fastq.gz \
~/Project_1/2_BWA_Output/trim/Patient_14_2.fastq.gz \
~/Project_1/2_BWA_Output/trim/Patient_14_2_up.fastq.gz \
ILLUMINACLIP:NexteraPE-PE.fa:2:30:10

fastqc --threads 2 -o ~/Project_1/2_BWA_Output/trim/fastqc ~/Project_1/2_BWA_Output/trim/Bat_1.fastq.gz
fastqc --threads 2 -o ~/Project_1/2_BWA_Output/trim/fastqc ~/Project_1/2_BWA_Output/trim/Bat_2.fastq.gz
fastqc --threads 2 -o ~/Project_1/2_BWA_Output/trim/fastqc ~/Project_1/2_BWA_Output/trim/Patient_14_1.fastq.gz
fastqc --threads 2 -o ~/Project_1/2_BWA_Output/trim/fastqc ~/Project_1/2_BWA_Output/trim/Patient_14_2.fastq.gz

rm ~/Project_1/2_BWA_Output/Bat*
rm ~/Project_1/2_BWA_Output/Patient_14*
	
bwa mem -t 8 -r 0.75 ~/Project_1/2_BWA_Output/index/patient_0_index \
~/Project_1/2_BWA_Output/trim/Bat_1.fastq.gz \
~/Project_1/2_BWA_Output/trim/Bat_2.fastq.gz \
2>~/Project_1/2_BWA_Output/Bat.log.txt | \
samtools view -bS - > ~/Project_1/2_BWA_Output/Bat.bam

bwa mem -t 8 -r 0.75 ~/Project_1/2_BWA_Output/index/patient_0_index \
~/Project_1/2_BWA_Output/trim/Patient_14_1.fastq.gz \
~/Project_1/2_BWA_Output/trim/Patient_14_2.fastq.gz \
2>~/Project_1/2_BWA_Output/Patient_14.log.txt | \
samtools view -bS - > ~/Project_1/2_BWA_Output/Patient_14.bam
