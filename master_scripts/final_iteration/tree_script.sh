#!/bin/sh
#6_tree
rm -r ~/Project_1/6_Tree/*
mkdir ~/Project_1/6_Tree/JC+G4
mkdir ~/Project_1/6_Tree/JC+G4/filtered
mkdir ~/Project_1/6_Tree/JC+G2
mkdir ~/Project_1/6_Tree/JC+G2/filtered
mkdir ~/Project_1/6_Tree/JC
mkdir ~/Project_1/6_Tree/JC/filtered

cp ~/Project_1/5_MSA_Output/filtered/all_variants_trimal.mfa ~/Project_1/6_Tree/JC+G4/filtered/all_variants_trimal.mfa
cp ~/Project_1/5_MSA_Output/filtered/all_variants_trimal.mfa ~/Project_1/6_Tree/JC+G2/filtered/all_variants_trimal.mfa
cp ~/Project_1/5_MSA_Output/filtered/all_variants_trimal.mfa ~/Project_1/6_Tree/JC/filtered/all_variants_trimal.mfa

raxml-ng --all --msa ~/Project_1/6_Tree/JC+G4/filtered/all_variants_trimal.mfa \
--model JC+G4 --tree rand{20} --bs-trees 250 \
--threads 1 --seed 12345

raxml-ng --all --msa ~/Project_1/6_Tree/JC+G2/filtered/all_variants_trimal.mfa \
--model JC+G2 --tree rand{20} --bs-trees 250 \
--threads 1 --seed 12345

raxml-ng --all --msa ~/Project_1/6_Tree/JC/filtered/all_variants_trimal.mfa \
--model JC --tree rand{20} --bs-trees 250 \
--threads 1 --seed 12345