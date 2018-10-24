#!/bin/sh
#6_tree
rm ~/Project_1/6_Tree/filtered/*
rm ~/Project_1/6_Tree/strict_filter/*
cp ~/Project_1/5_MSA_Output/filtered/all_variants_trimal.mfa ~/Project_1/6_Tree/filtered/all_variants_trimal.mfa
cp ~/Project_1/5_MSA_Output/strict_filter/all_variants_trimal.mfa ~/Project_1/6_Tree/strict_filter/all_variants_trimal.mfa

raxml-ng --all --msa ~/Project_1/6_Tree/filtered/all_variants_trimal.mfa \
--model GTR+G4 --tree rand{20} --bs-trees 250 \
--threads 1 --seed 12345

raxml-ng --all --msa ~/Project_1/6_Tree/strict_filter/all_variants_trimal.mfa \
--model GTR+G4 --tree rand{20} --bs-trees 250 \
--threads 1 --seed 12345