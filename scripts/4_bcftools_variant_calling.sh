#!/bin/sh
#TODO: check parameters
bcftools mpileup --fasta-ref ~/Project_1/ref_genome.fasta \
~/Project_1/3_SamTools_Output/Bat.sorted.bam | bcftools call -mv - \
>~/Project_1/4_BcfTools_Output/Bat.raw.vcf

bcftools mpileup --fasta-ref ~/Project_1/ref_genome.fasta \
~/Project_1/3_SamTools_Output/Cat.sorted.bam | bcftools call -mv - \
>~/Project_1/4_BcfTools_Output/Cat.raw.vcf

bcftools mpileup --fasta-ref ~/Project_1/ref_genome.fasta \
~/Project_1/3_SamTools_Output/Guinea_pig.sorted.bam | bcftools call -mv - \
>~/Project_1/4_BcfTools_Output/Guinea_pig.raw.vcf

bcftools mpileup --fasta-ref ~/Project_1/ref_genome.fasta \
~/Project_1/3_SamTools_Output/Rabid_raccoon_1.sorted.bam | bcftools call -mv - \
>~/Project_1/4_BcfTools_Output/Rabid_raccoon_1.raw.vcf

bcftools mpileup --fasta-ref ~/Project_1/ref_genome.fasta \
~/Project_1/3_SamTools_Output/Rabid_raccoon_2.sorted.bam | bcftools call -mv - \
>~/Project_1/4_BcfTools_Output/Rabid_raccoon_2.raw.vcf

bcftools mpileup --fasta-ref ~/Project_1/ref_genome.fasta \
~/Project_1/3_SamTools_Output/Rabid_raccoon_3.sorted.bam | bcftools call -mv - \
>~/Project_1/4_BcfTools_Output/Rabid_raccoon_3.raw.vcf

bcftools mpileup --fasta-ref ~/Project_1/ref_genome.fasta \
~/Project_1/3_SamTools_Output/Rabid_raccoon_4.sorted.bam | bcftools call -mv - \
>~/Project_1/4_BcfTools_Output/Rabid_raccoon_4.raw.vcf

bcftools mpileup --fasta-ref ~/Project_1/ref_genome.fasta \
~/Project_1/3_SamTools_Output/Patient_1.sorted.bam | bcftools call -mv - \
>~/Project_1/4_BcfTools_Output/Patient_1.raw.vcf

bcftools mpileup --fasta-ref ~/Project_1/ref_genome.fasta \
~/Project_1/3_SamTools_Output/Patient_2.sorted.bam | bcftools call -mv - \
>~/Project_1/4_BcfTools_Output/Patient_2.raw.vcf

bcftools mpileup --fasta-ref ~/Project_1/ref_genome.fasta \
~/Project_1/3_SamTools_Output/Patient_3.sorted.bam | bcftools call -mv - \
>~/Project_1/4_BcfTools_Output/Patient_3.raw.vcf

bcftools mpileup --fasta-ref ~/Project_1/ref_genome.fasta \
~/Project_1/3_SamTools_Output/Patient_4.sorted.bam | bcftools call -mv - \
>~/Project_1/4_BcfTools_Output/Patient_4.raw.vcf

bcftools mpileup --fasta-ref ~/Project_1/ref_genome.fasta \
~/Project_1/3_SamTools_Output/Patient_5.sorted.bam | bcftools call -mv - \
>~/Project_1/4_BcfTools_Output/Patient_5.raw.vcf

bcftools mpileup --fasta-ref ~/Project_1/ref_genome.fasta \
~/Project_1/3_SamTools_Output/Patient_6.sorted.bam | bcftools call -mv - \
>~/Project_1/4_BcfTools_Output/Patient_6.raw.vcf

bcftools mpileup --fasta-ref ~/Project_1/ref_genome.fasta \
~/Project_1/3_SamTools_Output/Patient_7.sorted.bam | bcftools call -mv - \
>~/Project_1/4_BcfTools_Output/Patient_7.raw.vcf

bcftools mpileup --fasta-ref ~/Project_1/ref_genome.fasta \
~/Project_1/3_SamTools_Output/Patient_8.sorted.bam | bcftools call -mv - \
>~/Project_1/4_BcfTools_Output/Patient_8.raw.vcf

bcftools mpileup --fasta-ref ~/Project_1/ref_genome.fasta \
~/Project_1/3_SamTools_Output/Patient_9.sorted.bam | bcftools call -mv - \
>~/Project_1/4_BcfTools_Output/Patient_9.raw.vcf

bcftools mpileup --fasta-ref ~/Project_1/ref_genome.fasta \
~/Project_1/3_SamTools_Output/Patient_10.sorted.bam | bcftools call -mv - \
>~/Project_1/4_BcfTools_Output/Patient_10.raw.vcf

bcftools mpileup --fasta-ref ~/Project_1/ref_genome.fasta \
~/Project_1/3_SamTools_Output/Patient_11.sorted.bam | bcftools call -mv - \
>~/Project_1/4_BcfTools_Output/Patient_11.raw.vcf

bcftools mpileup --fasta-ref ~/Project_1/ref_genome.fasta \
~/Project_1/3_SamTools_Output/Patient_12.sorted.bam | bcftools call -mv - \
>~/Project_1/4_BcfTools_Output/Patient_12.raw.vcf

bcftools mpileup --fasta-ref ~/Project_1/ref_genome.fasta \
~/Project_1/3_SamTools_Output/Patient_13.sorted.bam | bcftools call -mv - \
>~/Project_1/4_BcfTools_Output/Patient_13.raw.vcf

bcftools mpileup --fasta-ref ~/Project_1/ref_genome.fasta \
~/Project_1/3_SamTools_Output/Patient_14.sorted.bam | bcftools call -mv - \
>~/Project_1/4_BcfTools_Output/Patient_14.raw.vcf

bcftools mpileup --fasta-ref ~/Project_1/ref_genome.fasta \
~/Project_1/3_SamTools_Output/Patient_15.sorted.bam | bcftools call -mv - \
>~/Project_1/4_BcfTools_Output/Patient_15.raw.vcf

bcftools mpileup --fasta-ref ~/Project_1/ref_genome.fasta \
~/Project_1/3_SamTools_Output/Patient_16.sorted.bam | bcftools call -mv - \
>~/Project_1/4_BcfTools_Output/Patient_16.raw.vcf