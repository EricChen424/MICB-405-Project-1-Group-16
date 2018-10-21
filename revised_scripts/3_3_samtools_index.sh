#!/bin/sh
for sortedbam in ~/Project_1/3_SamTools_Output/*.sorted.rmdup.bam;
do
	prefix=$(basename $sortedbam | sed 's/.sorted.rmdup.bam//g')
	samtools index ~/Project_1/3_SamTools_Output/$prefix\.sorted.rmdup.bam
done