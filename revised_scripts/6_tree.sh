#!/bin/sh
#TODO: parameters
raxml-ng --all --msa ~/Project_1/5_MSA_Output/all_variants_trimal.mfa \
--model LG+G2 --tree rand{4} --bs-trees 4 \
--threads 2 --seed 12345