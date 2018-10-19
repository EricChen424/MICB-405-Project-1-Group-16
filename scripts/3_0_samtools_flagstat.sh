#!/bin/sh
for bam in ~/Project_1/2_BWA_Output/*.bam;
do
	prefix=$(basename $bam | sed 's/.bam//g')
	samtools flagstat ~/Project_1/2_BWA_Output/$prefix\.bam  > ~/Project_1/2_BWA_Output/stats/$prefix\.txt
done