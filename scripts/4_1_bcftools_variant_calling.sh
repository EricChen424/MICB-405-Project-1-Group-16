#!/bin/sh
#TODO: check parameters
for sortedbam in ~/Project_1/3_SamTools_Output/*.sorted.rmdup.bam;
do
	prefix=$(basename $sortedbam | sed 's/.sorted.rmdup.bam//g')
	bcftools mpileup --fasta-ref ~/Project_1/ref_genome.fasta \
	~/Project_1/3_SamTools_Output/$prefix\.sorted.rmdup.bam | bcftools call -mv - \
	>~/Project_1/4_BcfTools_Output/$prefix\.raw.vcf
done