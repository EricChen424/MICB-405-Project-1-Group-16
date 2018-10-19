#!/bin/sh
#TODO: this is a great candidate for parameter tweaking
bwa mem -t 12 ~/Project_1/2_BWA_Output/index/patient_0_index \
/projects/micb405/resources/project_1/Bat_1.fastq.gz \
/projects/micb405/resources/project_1/Bat_2.fastq.gz \
2>~/Project_1/2_BWA_Output/Bat.log.txt | \
samtools view -bS - > ~/Project_1/2_BWA_Output/Bat.bam

bwa mem -t 12 ~/Project_1/2_BWA_Output/index/patient_0_index \
/projects/micb405/resources/project_1/Cat_1.fastq.gz \
/projects/micb405/resources/project_1/Cat_2.fastq.gz \
2>~/Project_1/2_BWA_Output/Cat.log.txt | \
samtools view -bS - > ~/Project_1/2_BWA_Output/Cat.bam

bwa mem -t 12 ~/Project_1/2_BWA_Output/index/patient_0_index \
/projects/micb405/resources/project_1/Guinea_pig_1.fastq.gz \
/projects/micb405/resources/project_1/Guinea_pig_2.fastq.gz \
2>~/Project_1/2_BWA_Output/Guinea_pig.log.txt | \
samtools view -bS - > ~/Project_1/2_BWA_Output/Guinea_pig.bam

bwa mem -t 12 ~/Project_1/2_BWA_Output/index/patient_0_index \
/projects/micb405/resources/project_1/Rabid_raccoon_1_1.fastq.gz \
/projects/micb405/resources/project_1/Rabid_raccoon_1_2.fastq.gz \
2>~/Project_1/2_BWA_Output/Rabid_raccoon_1.log.txt | \
samtools view -bS - > ~/Project_1/2_BWA_Output/Rabid_raccoon_1.bam

bwa mem -t 12 ~/Project_1/2_BWA_Output/index/patient_0_index \
/projects/micb405/resources/project_1/Rabid_raccoon_2_1.fastq.gz \
/projects/micb405/resources/project_1/Rabid_raccoon_2_2.fastq.gz \
2>~/Project_1/2_BWA_Output/Rabid_raccoon_2.log.txt | \
samtools view -bS - > ~/Project_1/2_BWA_Output/Rabid_raccoon_2.bam

bwa mem -t 12 ~/Project_1/2_BWA_Output/index/patient_0_index \
/projects/micb405/resources/project_1/Rabid_raccoon_3_1.fastq.gz \
/projects/micb405/resources/project_1/Rabid_raccoon_3_2.fastq.gz \
2>~/Project_1/2_BWA_Output/Rabid_raccoon_3.log.txt | \
samtools view -bS - > ~/Project_1/2_BWA_Output/Rabid_raccoon_3.bam

bwa mem -t 12 ~/Project_1/2_BWA_Output/index/patient_0_index \
/projects/micb405/resources/project_1/Rabid_raccoon_4_1.fastq.gz \
/projects/micb405/resources/project_1/Rabid_raccoon_4_2.fastq.gz \
2>~/Project_1/2_BWA_Output/Rabid_raccoon_4.log.txt | \
samtools view -bS - > ~/Project_1/2_BWA_Output/Rabid_raccoon_4.bam

bwa mem -t 12 ~/Project_1/2_BWA_Output/index/patient_0_index \
/projects/micb405/resources/project_1/Patient_1_1.fastq.gz \
/projects/micb405/resources/project_1/Patient_1_2.fastq.gz \
2>~/Project_1/2_BWA_Output/Patient_1.log.txt | \
samtools view -bS - > ~/Project_1/2_BWA_Output/Patient_1.bam

bwa mem -t 12 ~/Project_1/2_BWA_Output/index/patient_0_index \
/projects/micb405/resources/project_1/Patient_2_1.fastq.gz \
/projects/micb405/resources/project_1/Patient_2_2.fastq.gz \
2>~/Project_1/2_BWA_Output/Patient_2.log.txt | \
samtools view -bS - > ~/Project_1/2_BWA_Output/Patient_2.bam

bwa mem -t 12 ~/Project_1/2_BWA_Output/index/patient_0_index \
/projects/micb405/resources/project_1/Patient_3_1.fastq.gz \
/projects/micb405/resources/project_1/Patient_3_2.fastq.gz \
2>~/Project_1/2_BWA_Output/Patient_3.log.txt | \
samtools view -bS - > ~/Project_1/2_BWA_Output/Patient_3.bam

bwa mem -t 12 ~/Project_1/2_BWA_Output/index/patient_0_index \
/projects/micb405/resources/project_1/Patient_4_1.fastq.gz \
/projects/micb405/resources/project_1/Patient_4_2.fastq.gz \
2>~/Project_1/2_BWA_Output/Patient_4.log.txt | \
samtools view -bS - > ~/Project_1/2_BWA_Output/Patient_4.bam

bwa mem -t 12 ~/Project_1/2_BWA_Output/index/patient_0_index \
/projects/micb405/resources/project_1/Patient_5_1.fastq.gz \
/projects/micb405/resources/project_1/Patient_5_2.fastq.gz \
2>~/Project_1/2_BWA_Output/Patient_5.log.txt | \
samtools view -bS - > ~/Project_1/2_BWA_Output/Patient_5.bam

bwa mem -t 12 ~/Project_1/2_BWA_Output/index/patient_0_index \
/projects/micb405/resources/project_1/Patient_6_1.fastq.gz \
/projects/micb405/resources/project_1/Patient_6_2.fastq.gz \
2>~/Project_1/2_BWA_Output/Patient_6.log.txt | \
samtools view -bS - > ~/Project_1/2_BWA_Output/Patient_6.bam

bwa mem -t 12 ~/Project_1/2_BWA_Output/index/patient_0_index \
/projects/micb405/resources/project_1/Patient_7_1.fastq.gz \
/projects/micb405/resources/project_1/Patient_7_2.fastq.gz \
2>~/Project_1/2_BWA_Output/Patient_7.log.txt | \
samtools view -bS - > ~/Project_1/2_BWA_Output/Patient_7.bam

bwa mem -t 12 ~/Project_1/2_BWA_Output/index/patient_0_index \
/projects/micb405/resources/project_1/Patient_8_1.fastq.gz \
/projects/micb405/resources/project_1/Patient_8_2.fastq.gz \
2>~/Project_1/2_BWA_Output/Patient_8.log.txt | \
samtools view -bS - > ~/Project_1/2_BWA_Output/Patient_8.bam

bwa mem -t 12 ~/Project_1/2_BWA_Output/index/patient_0_index \
/projects/micb405/resources/project_1/Patient_9_1.fastq.gz \
/projects/micb405/resources/project_1/Patient_9_2.fastq.gz \
2>~/Project_1/2_BWA_Output/Patient_9.log.txt | \
samtools view -bS - > ~/Project_1/2_BWA_Output/Patient_9.bam

bwa mem -t 12 ~/Project_1/2_BWA_Output/index/patient_0_index \
/projects/micb405/resources/project_1/Patient_10_1.fastq.gz \
/projects/micb405/resources/project_1/Patient_10_2.fastq.gz \
2>~/Project_1/2_BWA_Output/Bat.log.txt | \
samtools view -bS - > ~/Project_1/2_BWA_Output/Patient_10.bam

bwa mem -t 12 ~/Project_1/2_BWA_Output/index/patient_0_index \
/projects/micb405/resources/project_1/Patient_11_1.fastq.gz \
/projects/micb405/resources/project_1/Patient_11_2.fastq.gz \
2>~/Project_1/2_BWA_Output/Patient_11.log.txt | \
samtools view -bS - > ~/Project_1/2_BWA_Output/Patient_11.bam

bwa mem -t 12 ~/Project_1/2_BWA_Output/index/patient_0_index \
/projects/micb405/resources/project_1/Patient_12_1.fastq.gz \
/projects/micb405/resources/project_1/Patient_12_2.fastq.gz \
2>~/Project_1/2_BWA_Output/Patient_12.log.txt | \
samtools view -bS - > ~/Project_1/2_BWA_Output/Patient_12.bam

bwa mem -t 12 ~/Project_1/2_BWA_Output/index/patient_0_index \
/projects/micb405/resources/project_1/Patient_13_1.fastq.gz \
/projects/micb405/resources/project_1/Patient_13_2.fastq.gz \
2>~/Project_1/2_BWA_Output/Patient_13.log.txt | \
samtools view -bS - > ~/Project_1/2_BWA_Output/Patient_13.bam

bwa mem -t 12 ~/Project_1/2_BWA_Output/index/patient_0_index \
/projects/micb405/resources/project_1/Patient_14_1.fastq.gz \
/projects/micb405/resources/project_1/Patient_14_2.fastq.gz \
2>~/Project_1/2_BWA_Output/Patient_14.log.txt | \
samtools view -bS - > ~/Project_1/2_BWA_Output/Patient_14.bam

bwa mem -t 12 ~/Project_1/2_BWA_Output/index/patient_0_index \
/projects/micb405/resources/project_1/Patient_15_1.fastq.gz \
/projects/micb405/resources/project_1/Patient_15_2.fastq.gz \
2>~/Project_1/2_BWA_Output/Patient_15.log.txt | \
samtools view -bS - > ~/Project_1/2_BWA_Output/Patient_15.bam

bwa mem -t 12 ~/Project_1/2_BWA_Output/index/patient_0_index \
/projects/micb405/resources/project_1/Patient_16_1.fastq.gz \
/projects/micb405/resources/project_1/Patient_16_2.fastq.gz \
2>~/Project_1/2_BWA_Output/Patient_16.log.txt | \
samtools view -bS - > ~/Project_1/2_BWA_Output/Patient_16.bam