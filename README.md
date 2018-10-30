# Project 1
This repository contains data from each step of our pipeline for Project 1 of MICB 405, in addition to the scripts used and any additional data files that may be needed. The scripts should work as long as you upload all files in the [scripts folder](https://github.com/MICB405-Group-16/MICB-405-Project-1-Group-16/tree/master/scripts) into the same directory and run the master script within that directory. We have left out the FASTQ files and the BAM files because they take up too much space.

Note: If you get complaints with shell scripts about a bad interpreter with a ^M at the end, follow this page:
https://stackoverflow.com/questions/2920416/configure-bin-shm-bad-interpreter

ie. Open your script with vim, type :set fileformat=unix, hit Enter, then save with :wq

The [NexteraPE-PE.fa file](https://github.com/MICB405-Group-16/MICB-405-Project-1-Group-16/blob/master/scripts/NexteraPE-PE.fa) was obtained from the [Trimmomatic repository](https://github.com/timflutre/trimmomatic/tree/master/adapters). This was needed to remove Nextera adapters with Trimmomatic.

The [vcf_to_fasta.py](https://github.com/MICB405-Group-16/MICB-405-Project-1-Group-16/blob/master/scripts/vcf_to_fasta_het.py) file was obtained from the following [repository](https://github.com/jlgardy/tb_demo)

The MSADistanceMatrix.py file was taken from https://github.com/MICB405-Group-16/MSADistanceMatrix. Note that we ran this script locally and it isn't included in our master shell script.

# Folder Rundown
### 1_FASTQC_Output:
- contains the FastQC output for every set of paired end reads for each sample

### 2_BWA_Output:
- contains SAMtools flagstats statistics for every paired end alignment for each sample
- also contains FastQC output for Patient 14 and the Bat sample, following removal of Nextera adapters, to show the change in adapter count

### 4_BcfTools_Output:
Contains VCF output for each alignment's variants. By default, indels are removed from the VCF file.
- raw: no additional filters applied to VCF files
- filtered: QUAL >= 20, DP >= 5
- strict_filter: QUAL >= 20, DP >= 5, DP4[0] == 0, DP4[1] == 0, DP4[2] > 2, DP4[3] > 2
  - tries to also ensure that DP4 doesn't imply mapping to the reference allele and the alternate allele is balanced between forward and      reverse reads

### 5_MSA_Output:
- MSA output from MAFFT for both the filtered and strict_filter VCF files
- contains both the version before trimAI processing and the version after trimAI processing

### 6_Tree:
- RAxML ML phylogenies for the trimAI processed MSAs of both the filtered and strict_filter dataset
- includes the tree using different models such as JC, JC-G2, JC-G4, and GTR-G4 for comparison
- we chose to use the GTR-G4 model
