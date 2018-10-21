#!/bin/sh
for bam in ~/Project_1/3_SamTools_Output/*.sorted.rmdup.bam;
do
	prefix=$(basename $bam | sed 's/.sorted.rmdup.bam//g')
	samtools flagstat ~/Project_1/3_SamTools_Output/$prefix\.sorted.rmdup.bam  > ~/Project_1/2_BWA_Output/stats/$prefix\.txt
done