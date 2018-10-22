#!/bin/sh
cp ~/Project_1/5_MSA_Output/filtered/all_variants_trimal.mfa ~/Project_1/6_Tree/filtered/all_variants_trimal.mfa
cp ~/Project_1/5_MSA_Output/strict_filter/all_variants_trimal.mfa ~/Project_1/6_Tree/strict_filter/all_variants_trimal.mfa

raxml-ng --all --msa ~/Project_1/6_Tree/filtered/all_variants_trimal.mfa \
--model JC+G2 --tree rand{20} --bs-trees 100 \
--threads 1 --seed 12345

raxml-ng --all --msa ~/Project_1/6_Tree/strict_filter/all_variants_trimal.mfa \
--model JC+G2 --tree rand{20} --bs-trees 100 \
--threads 1 --seed 12345