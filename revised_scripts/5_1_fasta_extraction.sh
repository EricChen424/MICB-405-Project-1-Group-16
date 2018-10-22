#!/bin/sh
python ~/scripts/vcf_to_fasta_het.py ~/Project_1/4_BcfTools_Output/filtered/ all_variants
python ~/scripts/vcf_to_fasta_het.py ~/Project_1/4_BcfTools_Output/strict_filter/ all_variants
