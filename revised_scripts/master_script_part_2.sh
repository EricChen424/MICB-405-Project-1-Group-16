#!/bin/sh
#4_2_bcftools_filtering
for vcf in ~/Project_1/4_BcfTools_Output/raw/*.raw.vcf;
do
	prefix=$(basename $vcf | sed 's/.raw.vcf//g')
	#tries to get rid of bad quality, low coverage
	bcftools filter --include 'QUAL >= 20 & DP >= 5' \
	~/Project_1/4_BcfTools_Output/raw/$prefix\.raw.vcf -o ~/Project_1/4_BcfTools_Output/filtered/$prefix\.laxfiltered.vcf
done

for vcf in ~/Project_1/4_BcfTools_Output/raw/*.raw.vcf;
do
	prefix=$(basename $vcf | sed 's/.raw.vcf//g')
	#tries to get rid of bad quality, low coverage, and tries to keep read coverage reasonably balanced
	bcftools filter --include 'QUAL >= 20 & DP >= 5 & DP4[0] == 0 & DP4[1] == 0 & DP4[2] > 2 & DP4[3] > 2' \
	~/Project_1/4_BcfTools_Output/raw/$prefix\.raw.vcf -o ~/Project_1/4_BcfTools_Output/strict_filter/$prefix\.strictfiltered.vcf
done

#5_1_fasta_extraction
python ~/scripts/vcf_to_fasta_het.py ~/Project_1/4_BcfTools_Output/filtered/ all_variants
python ~/scripts/vcf_to_fasta_het.py ~/Project_1/4_BcfTools_Output/strict_filter/ all_variants

#5_2_msa
mafft --localpair --maxiterate 1000 \
~/Project_1/4_BcfTools_Output/filtered/all_variants.fasta \
> ~/Project_1/5_MSA_Output/filtered/all_variants.mfa

mafft --localpair --maxiterate 1000 \
~/Project_1/4_BcfTools_Output/strict_filter/all_variants.fasta \
> ~/Project_1/5_MSA_Output/strict_filter/all_variants.mfa

#5_3_trimal
trimal -automated1 \
-in ~/Project_1/5_MSA_Output/filtered/all_variants.mfa \
-out ~/Project_1/5_MSA_Output/filtered/all_variants_trimal.mfa

trimal -automated1 \
-in ~/Project_1/5_MSA_Output/strict_filter/all_variants.mfa \
-out ~/Project_1/5_MSA_Output/strict_filter/all_variants_trimal.mfa

#6_tree
cp ~/Project_1/5_MSA_Output/filtered/all_variants_trimal.mfa ~/Project_1/6_Tree/filtered/all_variants_trimal.mfa
cp ~/Project_1/5_MSA_Output/strict_filter/all_variants_trimal.mfa ~/Project_1/6_Tree/strict_filter/all_variants_trimal.mfa

raxml-ng --all --msa ~/Project_1/6_Tree/filtered/all_variants_trimal.mfa \
--model GTR+G --tree rand{200} --bs-trees 1000 \
--threads 1 --seed 12345

raxml-ng --all --msa ~/Project_1/6_Tree/strict_filter/all_variants_trimal.mfa \
--model GTR+G --tree rand{200} --bs-trees 1000 \
--threads 1 --seed 12345