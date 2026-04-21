#!/bin/bash

#SBATCH --job-name=star_align
#SBATCH --output=/mnt/data/bioinfo-estadistica-2/RNAseq_2026/BioProject_2026/scripts/out_logs/star_align_%j.out
#SBATCH --error=/mnt/data/bioinfo-estadistica-2/RNAseq_2026/BioProject_2026/scripts/out_logs/star_align_%j.err
#SBATCH --ntasks=1                  # Un solo proceso
#SBATCH --cpus-per-task=12        # Coincide con --runThreadN 12
#SBATCH --mem=120G                  # Memoria suficiente para indexar GRCh38STA

## --- Analisis de Fastqc ---
# 1. Cargar el módulo de Trimmomatic
module load star/2.7.9a 
cd /mnt/data/bioinfo-estadistica-2/RNAseq_2026/BioProject_2026

index=/mnt/data/bioinfo-estadistica-2/RNAseq_2026/BioProject_2026/align/STAR/STAR_index
FILES=/mnt/data/bioinfo-estadistica-2/RNAseq_2026/BioProject_2026/data/processed/*_1_trimmed.fq.gz

for f in $FILES
do
    base=$(basename "$f" _1_trimmed.fq.gz)   # Ej: SRR27190676
    read1="/mnt/data/bioinfo-estadistica-2/RNAseq_2026/BioProject_2026/data/processed/${base}_1_trimmed.fq.gz"
    read2="/mnt/data/bioinfo-estadistica-2/RNAseq_2026/BioProject_2026/data/processed/${base}_2_trimmed.fq.gz"

    echo "Procesando muestra: $base"

    STAR --runThreadN 12 \
         --genomeDir $index \
         --readFilesIn "$read1" "$read2" \
         --outSAMtype BAM SortedByCoordinate \
         --quantMode GeneCounts \
         --readFilesCommand zcat \
         --outFileNamePrefix /mnt/data/bioinfo-estadistica-2/RNAseq_2026/BioProject_2026/align/STAR/STAR_output/${base}.
done

