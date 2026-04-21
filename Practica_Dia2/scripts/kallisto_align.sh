#!/bin/bash

#SBATCH --job-name=kallisto
#SBATCH --output=/mnt/data/bioinfo-estadistica-2/RNAseq_2026/BioProject_2026/scripts/out_logs/kallisto_%j.out
#SBATCH --error=/mnt/data/bioinfo-estadistica-2/RNAseq_2026/BioProject_2026/scripts/out_logs/kallisto_%j.err
#SBATCH --ntasks=1                  # Un solo proceso
#SBATCH --cpus-per-task=12          # 12 hilos para Kallisto (coincide con --threads 12)
#SBATCH --mem=32G                   # Memoria suficiente para índices grandes (~30 GB)
#SBATCH --mail-type=END             # Notificación al finalizar
#SBATCH --mail-user=ecossnav@gmail.com       # Correo de notificación

## --- Analisis de Fastqc ---
# 1. Cargar el módulo de Trimmomatic
module load kallisto/0.45.0
cd /mnt/data/bioinfo-estadistica-2/RNAseq_2026/BioProject_2026

# Paso 2. Generar index de kallisto
# kallisto index -i ./align/kallisto/transcripts.idx ./reference/Homo_sapiens.GRCh38.transcripts.fa.gz

# Paso 3. Pseudoalineamiento de secuencia Paired-cend
for file in ./data/processed/*1_trimmed.fq.gz
do
  base=$(basename "$file" _1_trimmed.fq.gz)   # Ej: SRR27190676
  file_1="./data/processed/${base}_1_trimmed.fq.gz"
  file_2="./data/processed/${base}_2_trimmed.fq.gz"
  
  kallisto quant --index ./align/kallisto/transcripts.idx \
                 --output-dir ./align/kallisto/kallisto_quant/${base} \
                 --threads 12 "$file_1" "$file_2"
done


