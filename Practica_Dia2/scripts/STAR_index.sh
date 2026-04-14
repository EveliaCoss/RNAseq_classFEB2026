#!/bin/bash

#SBATCH --job-name=star_index
#SBATCH --output=/mnt/data/bioinfo-estadistica-2/RNAseq_2026/BioProject_2026/scripts/out_logs/star_index_%j.out
#SBATCH --error=/mnt/data/bioinfo-estadistica-2/RNAseq_2026/BioProject_2026/scripts/out_logs/star_index_%j.err
#SBATCH --ntasks=1                  # Un solo proceso
#SBATCH --cpus-per-task=30          # Coincide con --runThreadN 30
#SBATCH --mem=120G                  # Memoria suficiente para indexar GRCh38STA
#SBATCH --mail-type=END             # Notificación al finalizar
#SBATCH --mail-user=ecossnav@gmail.com       # Correo de notificación

## --- Analisis de Fastqc ---
# 1. Cargar el módulo de Trimmomatic
module load kallisto/0.45.0
cd /mnt/data/bioinfo-estadistica-2/RNAseq_2026/BioProject_2026

# Paso 2. Generar index de STAR
STAR --runThreadN 30 \
--runMode genomeGenerate \
--genomeDir ./align/STAR/STAR_index \
--genomeFastaFiles ./reference/GCF_000001405.40_GRCh38.p14_genomic.fna.gz \
--sjdbGTFfile ./reference/GCF_000001405.40_GRCh38.p14_genomic.gtf.gz \
--sjdbOverhang 149

# Parámetro --sjdbOverhang
#   + Debe ser igual a la longitud de tus lecturas menos 1.
#   + Ejemplo: si tus lecturas son de 100 pb → --sjdbOverhang 99.
#   + Si son de 150 pb → --sjdbOverhang 149.
