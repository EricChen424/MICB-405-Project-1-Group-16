#!/bin/sh
mkdir ~/Project_1
mkdir ~/Project_1/1_FastQC_Output
mkdir ~/Project_1/2_BWA_Output
mkdir ~/Project_1/2_BWA_Output/index
mkdir ~/Project_1/2_BWA_Output/stats
mkdir ~/Project_1/2_BWA_Output/trim
mkdir ~/Project_1/2_BWA_Output/trim/fastqc
mkdir ~/Project_1/3_SamTools_Output
mkdir ~/Project_1/4_BcfTools_Output
mkdir ~/Project_1/4_BcfTools_Output/raw
mkdir ~/Project_1/4_BcfTools_Output/filtered
mkdir ~/Project_1/4_BcfTools_Output/strict_filter
mkdir ~/Project_1/5_MSA_Output
mkdir ~/Project_1/5_MSA_Output/filtered
mkdir ~/Project_1/5_MSA_Output/strict_filter
mkdir ~/Project_1/6_Tree
mkdir ~/Project_1/6_Tree/filtered
mkdir ~/Project_1/6_Tree/strict_filter

cp /projects/micb405/resources/project_1/ref_genome.fasta ~/Project_1/

#2_1_bwa_index
bwa index -p ~/Project_1/2_BWA_Output/index/patient_0_index /projects/micb405/resources/project_1/ref_genome.fasta

#2_2_bwa_mem
for fastq in /projects/micb405/resources/project_1/*_1.fastq.gz;
do
	prefix=$(basename $fastq | sed 's/_1.fastq.gz//g')
	bwa mem -t 8 -r 0.75 ~/Project_1/2_BWA_Output/index/patient_0_index \
	/projects/micb405/resources/project_1/$prefix\_1.fastq.gz \
	/projects/micb405/resources/project_1/$prefix\_2.fastq.gz \
	2>~/Project_1/2_BWA_Output/$prefix\.log.txt | \
	samtools view -bS - > ~/Project_1/2_BWA_Output/$prefix\.bam
done

#trimmomatic
trimmomatic PE -phred33 /projects/micb405/resources/project_1/Bat_1.fastq.gz \
/projects/micb405/resources/project_1/Bat_1.fastq.gz \
~/Project_1/2_BWA_Output/trim/Bat_1.fastq.gz \
~/Project_1/2_BWA_Output/trim/Bat_1_up.fastq.gz \
~/Project_1/2_BWA_Output/trim/Bat_2.fastq.gz \
~/Project_1/2_BWA_Output/trim/Bat_2_up.fastq.gz \
ILLUMINACLIP:NexteraPE-PE.fa:2:30:10

trimmomatic PE -phred33 /projects/micb405/resources/project_1/Patient_14_1.fastq.gz \
/projects/micb405/resources/project_1/Patient_14_2.fastq.gz \
~/Project_1/2_BWA_Output/trim/Patient_14_1.fastq.gz \
~/Project_1/2_BWA_Output/trim/Patient_14_1_up.fastq.gz \
~/Project_1/2_BWA_Output/trim/Patient_14_2.fastq.gz \
~/Project_1/2_BWA_Output/trim/Patient_14_2_up.fastq.gz \
ILLUMINACLIP:NexteraPE-PE.fa:2:30:10

fastqc --threads 2 -o ~/Project_1/2_BWA_Output/trim/fastqc ~/Project_1/2_BWA_Output/trim/Bat_1.fastq.gz
fastqc --threads 2 -o ~/Project_1/2_BWA_Output/trim/fastqc ~/Project_1/2_BWA_Output/trim/Bat_2.fastq.gz
fastqc --threads 2 -o ~/Project_1/2_BWA_Output/trim/fastqc ~/Project_1/2_BWA_Output/trim/Patient_14_1.fastq.gz
fastqc --threads 2 -o ~/Project_1/2_BWA_Output/trim/fastqc ~/Project_1/2_BWA_Output/trim/Patient_14_2.fastq.gz

rm ~/Project_1/2_BWA_Output/Bat*
rm ~/Project_1/2_BWA_Output/Patient_14*
	
bwa mem -t 8 -r 0.75 ~/Project_1/2_BWA_Output/index/patient_0_index \
~/Project_1/2_BWA_Output/trim/Bat_1.fastq.gz \
~/Project_1/2_BWA_Output/trim/Bat_2.fastq.gz \
2>~/Project_1/2_BWA_Output/Bat.log.txt | \
samtools view -bS - > ~/Project_1/2_BWA_Output/Bat.bam

bwa mem -t 8 -r 0.75 ~/Project_1/2_BWA_Output/index/patient_0_index \
~/Project_1/2_BWA_Output/trim/Patient_14_1.fastq.gz \
~/Project_1/2_BWA_Output/trim/Patient_14_2.fastq.gz \
2>~/Project_1/2_BWA_Output/Patient_14.log.txt | \
samtools view -bS - > ~/Project_1/2_BWA_Output/Patient_14.bam

#3_1_samtools_bam_sorting
for bam in ~/Project_1/2_BWA_Output/*.bam;
do
	prefix=$(basename $bam | sed 's/.bam//g')
	samtools sort ~/Project_1/2_BWA_Output/$prefix\.bam 1>~/Project_1/3_SamTools_Output/$prefix\.sorted.bam
done

#3_0_samtools_flagstat
for bam in ~/Project_1/3_SamTools_Output/*.sorted.bam;
do
	prefix=$(basename $bam | sed 's/.sorted.bam//g')
	samtools flagstat ~/Project_1/3_SamTools_Output/$prefix\.sorted.bam  > ~/Project_1/2_BWA_Output/stats/$prefix\.txt
done

#3_3_samtools_index
for sortedbam in ~/Project_1/3_SamTools_Output/*.sorted.bam;
do
	prefix=$(basename $sortedbam | sed 's/.sorted.bam//g')
	samtools index ~/Project_1/3_SamTools_Output/$prefix\.sorted.bam
done

#4_1_bcftools_variant_calling
for sortedbam in ~/Project_1/3_SamTools_Output/*.sorted.bam;
do
	prefix=$(basename $sortedbam | sed 's/.sorted.bam//g')
	bcftools mpileup -I --fasta-ref ~/Project_1/ref_genome.fasta \
	~/Project_1/3_SamTools_Output/$prefix\.sorted.bam | bcftools call -mv - \
	>~/Project_1/4_BcfTools_Output/raw/$prefix\.raw.vcf
done

#the Bat file is messed up without the -A flag
bcftools mpileup -I -A --fasta-ref ~/Project_1/ref_genome.fasta \
~/Project_1/3_SamTools_Output/Bat.sorted.bam | bcftools call -mv - \
>~/Project_1/4_BcfTools_Output/raw/Bat.raw.vcf

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