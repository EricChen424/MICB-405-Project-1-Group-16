#!/bin/sh
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
