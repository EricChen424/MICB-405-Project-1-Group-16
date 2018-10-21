#!/bin/sh
#TODO: optional for now
for vcf in ~/Project_1/4_BcfTools_Output/*.raw.vcf;
do
	prefix=$(basename $vcf | sed 's/.raw.vcf//g')
	#TODO: might want to do more than QUAL < 200
	bcftools filter --exclude "QUAL < 200" ~/Project_1/4_BcfTools_Output/$prefix\.raw.vcf
done