#!/bin/sh
#TODO: do we need to include smaller commands like copying files to local directory and gunzipping them?
#cp -r /projects/micb405/resources/project_1/. ~/Project_1/data/
#gunzip *.gz (assumes you're in the directory with all the fastqs)
fastqc --threads 2 -o ~/Project_1/1_FastQC_Output/ ~/Project_1/data/*.fastq 
