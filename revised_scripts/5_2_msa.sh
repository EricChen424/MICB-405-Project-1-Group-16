#!/bin/sh
mafft --localpair --maxiterate 1000 \
~/Project_1/4_BcfTools_Output/filtered/all_variants.fasta \
> ~/Project_1/5_MSA_Output/filtered/all_variants.mfa

mafft --localpair --maxiterate 1000 \
~/Project_1/4_BcfTools_Output/strict_filter/all_variants.fasta \
> ~/Project_1/5_MSA_Output/strict_filter/all_variants.mfa

