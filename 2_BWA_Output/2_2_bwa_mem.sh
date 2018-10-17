#!/bin/sh
bwa mem -t 4 ~/Project_1/2_BWA_Output/index/patient_0_index \
~/Project_1/data/Bat_1.fastq ~/Project_1/data/Bat_2.fastq \
1>~/Project_1/2_BWA_Output/Bat.sam 2>~/Project_1/2_BWA_Output/Bat.log.txt