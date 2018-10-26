#!/bin/sh
mkdir ~/Project_1
mkdir ~/Project_1/1_FastQC_Output
mkdir ~/Project_1/2_BWA_Output
mkdir ~/Project_1/2_BWA_Output/index
mkdir ~/Project_1/2_BWA_Output/stats
mkdir ~/Project_1/3_SamTools_Output
mkdir ~/Project_1/4_BcfTools_Output
mkdir ~/Project_1/5_MSA_Output

cp /projects/micb405/resources/project_1/ref_genome.fasta ~/Project_1/

#1_fastqc
fastqc --threads 2 -o ~/Project_1/1_FastQC_Output/ /projects/micb405/resources/project_1/*.fastq.gz

#2_bwa
bwa index -p ~/Project_1/2_BWA_Output/index/patient_0_index /projects/micb405/resources/project_1/ref_genome.fasta

for fastq in /projects/micb405/resources/project_1/*_1.fastq.gz;
do
	prefix=$(basename $fastq | sed 's/_1.fastq.gz//g')
	bwa mem -t 8 ~/Project_1/2_BWA_Output/index/patient_0_index \
	/projects/micb405/resources/project_1/$prefix\_1.fastq.gz \
	/projects/micb405/resources/project_1/$prefix\_2.fastq.gz \
	2>~/Project_1/2_BWA_Output/$prefix\.log.txt | \
	samtools view -bS - > ~/Project_1/2_BWA_Output/$prefix\.bam
done

#3_samtools
for bam in ~/Project_1/2_BWA_Output/*.bam;
do
	prefix=$(basename $bam | sed 's/.bam//g')
	samtools flagstat ~/Project_1/2_BWA_Output/$prefix\.bam  > ~/Project_1/2_BWA_Output/stats/$prefix\.txt
done

for bam in ~/Project_1/2_BWA_Output/*.bam;
do
	prefix=$(basename $bam | sed 's/.bam//g')
	samtools sort ~/Project_1/2_BWA_Output/$prefix\.bam 1>~/Project_1/3_SamTools_Output/$prefix\.sorted.bam
done

for sortedbam in ~/Project_1/3_SamTools_Output/*.sorted.bam;
do
	prefix=$(basename $sortedbam | sed 's/.sorted.bam//g')
	samtools index ~/Project_1/3_SamTools_Output/$prefix\.sorted.bam
done

#4_bcftools
for sortedbam in ~/Project_1/3_SamTools_Output/*.sorted.rmdup.bam;
do
	prefix=$(basename $sortedbam | sed 's/.sorted.rmdup.bam//g')
	bcftools mpileup --fasta-ref ~/Project_1/ref_genome.fasta \
	~/Project_1/3_SamTools_Output/$prefix\.sorted.rmdup.bam | bcftools call -mv - \
	>~/Project_1/4_BcfTools_Output/$prefix\.raw.vcf
done

for vcf in ~/Project_1/4_BcfTools_Output/*.raw.vcf;
do
	prefix=$(basename $vcf | sed 's/.raw.vcf//g')
	#TODO: might want to do more than QUAL < 200
	bcftools filter --exclude "QUAL < 200" ~/Project_1/4_BcfTools_Output/$prefix\.raw.vcf
done

#5_msa
python ~/scripts/vcf_to_fasta_het.py ~/Project_1/4_BcfTools_Output/ all_variants

mafft --auto ~/Project_1/4_BcfTools_Output/all_variants.fasta \
> ~/Project_1/5_MSA_Output/all_variants.mfa

trimal -automated1 \
-in ~/Project_1/5_MSA_Output/all_variants.mfa \
-out ~/Project_1/5_MSA_Output/all_variants_trimal.mfa

raxml-ng --all --msa ~/Project_1/5_MSA_Output/all_variants_trimal.mfa \
--model GTR+G2 --tree rand{4} --bs-trees 4 \
--threads 2 --seed 12345