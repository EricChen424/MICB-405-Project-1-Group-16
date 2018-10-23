#!/bin/sh
for sortedbam in ~/Project_1/3_SamTools_Output/*.sorted.bam;
do
	prefix=$(basename $sortedbam | sed 's/.sorted.bam//g')
	samtools rmdup ~/Project_1/3_SamTools_Output/$prefix\.sorted.bam \
	~/Project_1/3_SamTools_Output/$prefix\.sorted.rmdup.bam
done