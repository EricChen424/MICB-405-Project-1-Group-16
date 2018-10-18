#!/bin/sh
#TODO: samtools view might be worthwhile to tweak primarily for filtering - we should use samtools 
#flagstat later on to compare BAM quality after playing with parameters, this file just does
# a default BAM conversion
samtools view -bS -o ~/Project_1/3_Samtools_Output/BAM/Bat.bam \
~/Project_1/2_BWA_Output/Bat.sam

samtools view -bS -o ~/Project_1/3_Samtools_Output/BAM/Cat.bam \
~/Project_1/2_BWA_Output/Cat.sam

samtools view -bS -o ~/Project_1/3_Samtools_Output/BAM/Guinea_pig.bam \
~/Project_1/2_BWA_Output/Guinea_pig.sam

samtools view -bS -o ~/Project_1/3_Samtools_Output/BAM/Rabid_raccoon_1.bam \
~/Project_1/2_BWA_Output/Rabid_raccoon_1.sam

samtools view -bS -o ~/Project_1/3_Samtools_Output/BAM/Rabid_raccoon_2.bam \
~/Project_1/2_BWA_Output/Rabid_raccoon_2.sam

samtools view -bS -o ~/Project_1/3_Samtools_Output/BAM/Rabid_raccoon_3.bam \
~/Project_1/2_BWA_Output/Rabid_raccoon_3.sam

samtools view -bS -o ~/Project_1/3_Samtools_Output/BAM/Rabid_raccoon_4.bam \
~/Project_1/2_BWA_Output/Rabid_raccoon_4.sam

samtools view -bS -o ~/Project_1/3_Samtools_Output/BAM/Patient_1.bam \
~/Project_1/2_BWA_Output/Patient_1.sam

samtools view -bS -o ~/Project_1/3_Samtools_Output/BAM/Patient_2.bam \
~/Project_1/2_BWA_Output/Patient_2.sam

samtools view -bS -o ~/Project_1/3_Samtools_Output/BAM/Patient_3.bam \
~/Project_1/2_BWA_Output/Patient_3.sam

samtools view -bS -o ~/Project_1/3_Samtools_Output/BAM/Patient_4.bam \
~/Project_1/2_BWA_Output/Patient_4.sam

samtools view -bS -o ~/Project_1/3_Samtools_Output/BAM/Patient_5.bam \
~/Project_1/2_BWA_Output/Patient_5.sam

samtools view -bS -o ~/Project_1/3_Samtools_Output/BAM/Patient_6.bam \
~/Project_1/2_BWA_Output/Patient_6.sam

samtools view -bS -o ~/Project_1/3_Samtools_Output/BAM/Patient_7.bam \
~/Project_1/2_BWA_Output/Patient_7.sam

samtools view -bS -o ~/Project_1/3_Samtools_Output/BAM/Patient_8.bam \
~/Project_1/2_BWA_Output/Patient_8.sam

samtools view -bS -o ~/Project_1/3_Samtools_Output/BAM/Patient_9.bam \
~/Project_1/2_BWA_Output/Patient_9.sam

samtools view -bS -o ~/Project_1/3_Samtools_Output/BAM/Patient_10.bam \
~/Project_1/2_BWA_Output/Patient_10.sam

samtools view -bS -o ~/Project_1/3_Samtools_Output/BAM/Patient_11.bam \
~/Project_1/2_BWA_Output/Patient_11.sam

samtools view -bS -o ~/Project_1/3_Samtools_Output/BAM/Patient_12.bam \
~/Project_1/2_BWA_Output/Patient_12.sam

samtools view -bS -o ~/Project_1/3_Samtools_Output/BAM/Patient_13.bam \
~/Project_1/2_BWA_Output/Patient_13.sam

samtools view -bS -o ~/Project_1/3_Samtools_Output/BAM/Patient_14.bam \
~/Project_1/2_BWA_Output/Patient_14.sam

samtools view -bS -o ~/Project_1/3_Samtools_Output/BAM/Patient_15.bam \
~/Project_1/2_BWA_Output/Patient_15.sam

samtools view -bS -o ~/Project_1/3_Samtools_Output/BAM/Patient_16.bam \
~/Project_1/2_BWA_Output/Patient_16.sam