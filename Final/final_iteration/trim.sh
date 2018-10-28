#!/bin/sh
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
