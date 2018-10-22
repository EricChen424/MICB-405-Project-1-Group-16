#!/bin/sh
for vcf in ~/Project_1/4_BcfTools_Output/raw/*.raw.vcf;
do
	prefix=$(basename $vcf | sed 's/.raw.vcf//g')
	#tries to get rid of bad quality, low coverage
	bcftools filter --include 'QUAL >= 20 & DP >= 5' \
	~/Project_1/4_BcfTools_Output/raw/$prefix\.raw.vcf -o ~/Project_1/4_BcfTools_Output/filtered/$prefix\.laxfiltered.vcf
done