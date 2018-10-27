#!/bin/sh
trimmomatic PE -phred33 /projects/micb405/resources/project_1/Bat_1.fastq.gz \
/projects/micb405/resources/project_1/Bat_1.fastq.gz \
~/Project_1/2_BWA_Output/trim/Bat_1.fastq.gz \
~/Project_1/2_BWA_Output/trim/Bat_1_up.fastq.gz \
~/Project_1/2_BWA_Output/trim/Bat_2.fastq.gz \
~/Project_1/2_BWA_Output/trim/Bat_1_up.fastq.gz \
ILLUMINACLIP:NexteraPE-PE.fa:2:30:10

trimmomatic PE -phred33 /projects/micb405/resources/project_1/Patient_14_1.fastq.gz \
/projects/micb405/resources/project_1/Patient_14_2.fastq.gz \
~/Project_1/2_BWA_Output/trim/Patient_14_1.fastq.gz \
~/Project_1/2_BWA_Output/trim/Patient_14_1_up.fastq.gz \
~/Project_1/2_BWA_Output/trim/Patient_14_2.fastq.gz \
~/Project_1/2_BWA_Output/trim/Patient_14_1_up.fastq.gz \
ILLUMINACLIP:NexteraPE-PE.fa:2:30:10

fastqc --threads 2 -o ~/Project_1/2_BWA_Output/trim/fastqc ~/Project_1/2_BWA_Output/trim/Bat_1.fastq.gz
fastqc --threads 2 -o ~/Project_1/2_BWA_Output/trim/fastqc ~/Project_1/2_BWA_Output/trim/Bat_2.fastq.gz
fastqc --threads 2 -o ~/Project_1/2_BWA_Output/trim/fastqc ~/Project_1/2_BWA_Output/trim/Patient_14_1.fastq.gz
fastqc --threads 2 -o ~/Project_1/2_BWA_Output/trim/fastqc ~/Project_1/2_BWA_Output/trim/Patient_14_2.fastq.gz