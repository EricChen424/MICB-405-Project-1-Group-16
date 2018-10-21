#!/bin/sh
for sortedbam in ~/Project_1/3_SamTools_Output/*.rmdup.sorted.bam;
do
	prefix=$(basename $sortedbam | sed 's/.rmdup.sorted.bam//g')
	samtools index ~/Project_1/3_SamTools_Output/$prefix\.rmdup.sorted.bam
done