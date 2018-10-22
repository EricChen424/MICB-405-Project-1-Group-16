#!/bin/sh
for fastq in /projects/micb405/resources/project_1/*_1.fastq.gz;
do
	prefix=$(basename $fastq | sed 's/_1.fastq.gz//g')
	bwa mem -t 8 ~/Project_1/2_BWA_Output/index/patient_0_index \
	/projects/micb405/resources/project_1/$prefix\_1.fastq.gz \
	/projects/micb405/resources/project_1/$prefix\_2.fastq.gz \
	2>~/Project_1/2_BWA_Output/$prefix\.log.txt | \
	samtools view -bS - > ~/Project_1/2_BWA_Output/$prefix\.bam
done