#!/bin/sh
#TODO: consider doing other steps here like rmdup, filtering out certain bit sequences in view
for sortedbam in ~/Project_1/3_SamTools_Output/*.sorted.bam;
do
	prefix=$(basename $sortedbam | sed 's/.sorted.bam//g')
	samtools rmdup ~/Project_1/3_SamTools_Output/$prefix\.rmdup.sorted.bam
done