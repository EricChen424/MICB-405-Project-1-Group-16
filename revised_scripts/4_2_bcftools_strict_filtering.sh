#!/bin/sh
for vcf in ~/Project_1/4_BcfTools_Output/raw/*.raw.vcf;
do
	prefix=$(basename $vcf | sed 's/.raw.vcf//g')
	#tries to get rid of bad quality, low coverage, and tries to keep read coverage reasonably balanced
	bcftools filter --include 'QUAL >= 20 & DP >= 5 & DP4[0] == 0 & DP4[1] == 0 & DP4[2] > 2 & DP4[3] > 2' \
	~/Project_1/4_BcfTools_Output/raw/$prefix\.raw.vcf -o ~/Project_1/4_BcfTools_Output/strict_filter/$prefix\.strictfiltered.vcf
done