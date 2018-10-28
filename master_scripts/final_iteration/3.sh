#!/bin/sh
#4_1_bcftools_variant_calling
for sortedbam in ~/Project_1/3_SamTools_Output/*.sorted.bam;
do
	prefix=$(basename $sortedbam | sed 's/.sorted.bam//g')
	bcftools mpileup -I --fasta-ref ~/Project_1/ref_genome.fasta \
	~/Project_1/3_SamTools_Output/$prefix\.sorted.bam | bcftools call -mv - \
	>~/Project_1/4_BcfTools_Output/raw/$prefix\.raw.vcf
done
