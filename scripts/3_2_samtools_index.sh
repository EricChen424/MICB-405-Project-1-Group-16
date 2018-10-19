#!/bin/sh
#this step doesn't really have any worthwhile parameters
for sortedbam in ~/Project_1/3_SamTools_Output/*.sorted.bam;
do
	prefix=$(basename $sortedbam | sed 's/.sorted.bam//g')
	samtools index ~/Project_1/3_SamTools_Output/$prefix\.sorted.bam
done