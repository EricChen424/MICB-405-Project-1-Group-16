#!/bin/sh
#TODO: this is a great candidate for parameter tweaking
bwa mem -t 4 ~/Project_1/2_BWA_Output/index/patient_0_index \
~/Project_1/data/Bat_1.fastq ~/Project_1/data/Bat_2.fastq \
1>~/Project_1/2_BWA_Output/Bat.sam 2>~/Project_1/2_BWA_Output/Bat.log.txt

bwa mem -t 4 ~/Project_1/2_BWA_Output/index/patient_0_index \
~/Project_1/data/Cat_1.fastq ~/Project_1/data/Cat_2.fastq \
1>~/Project_1/2_BWA_Output/Cat.sam 2>~/Project_1/2_BWA_Output/Cat.log.txt

bwa mem -t 4 ~/Project_1/2_BWA_Output/index/patient_0_index \
~/Project_1/data/Guinea_pig_1.fastq ~/Project_1/data/Guinea_pig_2.fastq \
1>~/Project_1/2_BWA_Output/Guinea_pig.sam 2>~/Project_1/2_BWA_Output/Guinea_pig.log.txt

bwa mem -t 4 ~/Project_1/2_BWA_Output/index/patient_0_index \
~/Project_1/data/Rabid_raccoon_1_1.fastq ~/Project_1/data/Rabid_raccoon_1_2.fastq \
1>~/Project_1/2_BWA_Output/Rabid_raccoon_1.sam 2>~/Project_1/2_BWA_Output/Rabid_raccoon_1.log.txt

bwa mem -t 4 ~/Project_1/2_BWA_Output/index/patient_0_index \
~/Project_1/data/Rabid_raccoon_2_1.fastq ~/Project_1/data/Rabid_raccoon_2_2.fastq \
1>~/Project_1/2_BWA_Output/Rabid_raccoon_2.sam 2>~/Project_1/2_BWA_Output/Rabid_raccoon_2.log.txt

bwa mem -t 4 ~/Project_1/2_BWA_Output/index/patient_0_index \
~/Project_1/data/Rabid_raccoon_3_1.fastq ~/Project_1/data/Rabid_raccoon_3_2.fastq \
1>~/Project_1/2_BWA_Output/Rabid_raccoon_3.sam 2>~/Project_1/2_BWA_Output/Rabid_raccoon_3.log.txt

bwa mem -t 4 ~/Project_1/2_BWA_Output/index/patient_0_index \
~/Project_1/data/Rabid_raccoon_4_1.fastq ~/Project_1/data/Rabid_raccoon_4_2.fastq \
1>~/Project_1/2_BWA_Output/Rabid_raccoon_4.sam 2>~/Project_1/2_BWA_Output/Rabid_raccoon_4.log.txt

bwa mem -t 4 ~/Project_1/2_BWA_Output/index/patient_0_index \
~/Project_1/data/Patient_1_1.fastq ~/Project_1/data/Patient_1_2.fastq \
1>~/Project_1/2_BWA_Output/Patient_1.sam 2>~/Project_1/2_BWA_Output/Patient_1.log.txt

bwa mem -t 4 ~/Project_1/2_BWA_Output/index/patient_0_index \
~/Project_1/data/Patient_2_1.fastq ~/Project_1/data/Patient_2_2.fastq \
1>~/Project_1/2_BWA_Output/Patient_2.sam 2>~/Project_1/2_BWA_Output/Patient_2.log.txt

bwa mem -t 4 ~/Project_1/2_BWA_Output/index/patient_0_index \
~/Project_1/data/Patient_3_1.fastq ~/Project_1/data/Patient_3_2.fastq \
1>~/Project_1/2_BWA_Output/Patient_3.sam 2>~/Project_1/2_BWA_Output/Patient_3.log.txt

bwa mem -t 4 ~/Project_1/2_BWA_Output/index/patient_0_index \
~/Project_1/data/Patient_4_1.fastq ~/Project_1/data/Patient_4_2.fastq \
1>~/Project_1/2_BWA_Output/Patient_4.sam 2>~/Project_1/2_BWA_Output/Patient_4.log.txt

bwa mem -t 4 ~/Project_1/2_BWA_Output/index/patient_0_index \
~/Project_1/data/Patient_5_1.fastq ~/Project_1/data/Patient_5_2.fastq \
1>~/Project_1/2_BWA_Output/Patient_5.sam 2>~/Project_1/2_BWA_Output/Patient_5.log.txt

bwa mem -t 4 ~/Project_1/2_BWA_Output/index/patient_0_index \
~/Project_1/data/Patient_6_1.fastq ~/Project_1/data/Patient_6_2.fastq \
1>~/Project_1/2_BWA_Output/Patient_6.sam 2>~/Project_1/2_BWA_Output/Patient_6.log.txt

bwa mem -t 4 ~/Project_1/2_BWA_Output/index/patient_0_index \
~/Project_1/data/Patient_7_1.fastq ~/Project_1/data/Patient_7_2.fastq \
1>~/Project_1/2_BWA_Output/Patient_7.sam 2>~/Project_1/2_BWA_Output/Patient_7.log.txt

bwa mem -t 4 ~/Project_1/2_BWA_Output/index/patient_0_index \
~/Project_1/data/Patient_8_1.fastq ~/Project_1/data/Patient_8_2.fastq \
1>~/Project_1/2_BWA_Output/Patient_8.sam 2>~/Project_1/2_BWA_Output/Patient_8.log.txt

bwa mem -t 4 ~/Project_1/2_BWA_Output/index/patient_0_index \
~/Project_1/data/Patient_9_1.fastq ~/Project_1/data/Patient_9_2.fastq \
1>~/Project_1/2_BWA_Output/Patient_9.sam 2>~/Project_1/2_BWA_Output/Patient_9.log.txt

bwa mem -t 4 ~/Project_1/2_BWA_Output/index/patient_0_index \
~/Project_1/data/Patient_10_1.fastq ~/Project_1/data/Patient_10_2.fastq \
1>~/Project_1/2_BWA_Output/Patient_10.sam 2>~/Project_1/2_BWA_Output/Patient_10.log.txt

bwa mem -t 4 ~/Project_1/2_BWA_Output/index/patient_0_index \
~/Project_1/data/Patient_11_1.fastq ~/Project_1/data/Patient_11_2.fastq \
1>~/Project_1/2_BWA_Output/Patient_11.sam 2>~/Project_1/2_BWA_Output/Patient_11.log.txt

bwa mem -t 4 ~/Project_1/2_BWA_Output/index/patient_0_index \
~/Project_1/data/Patient_12_1.fastq ~/Project_1/data/Patient_12_2.fastq \
1>~/Project_1/2_BWA_Output/Patient_12.sam 2>~/Project_1/2_BWA_Output/Patient_12.log.txt

bwa mem -t 4 ~/Project_1/2_BWA_Output/index/patient_0_index \
~/Project_1/data/Patient_13_1.fastq ~/Project_1/data/Patient_13_2.fastq \
1>~/Project_1/2_BWA_Output/Patient_13.sam 2>~/Project_1/2_BWA_Output/Patient_13.log.txt

bwa mem -t 4 ~/Project_1/2_BWA_Output/index/patient_0_index \
~/Project_1/data/Patient_14_1.fastq ~/Project_1/data/Patient_14_2.fastq \
1>~/Project_1/2_BWA_Output/Patient_14.sam 2>~/Project_1/2_BWA_Output/Patient_14.log.txt

bwa mem -t 4 ~/Project_1/2_BWA_Output/index/patient_0_index \
~/Project_1/data/Patient_15_1.fastq ~/Project_1/data/Patient_15_2.fastq \
1>~/Project_1/2_BWA_Output/Patient_15.sam 2>~/Project_1/2_BWA_Output/Patient_15.log.txt

bwa mem -t 4 ~/Project_1/2_BWA_Output/index/patient_0_index \
~/Project_1/data/Patient_16_1.fastq ~/Project_1/data/Patient_16_2.fastq \
1>~/Project_1/2_BWA_Output/Patient_16.sam 2>~/Project_1/2_BWA_Output/Patient_16.log.txt