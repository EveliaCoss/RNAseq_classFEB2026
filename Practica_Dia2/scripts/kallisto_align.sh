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
kallisto index -i ./align/kallisto/transcripts.idx ./reference/Homo_sapiens.GRCh38.transcripts.fa.gz

# Paso 3. Pseudoalineamiento de secuencia Paired-end
for file in ./data/processed/*_1.fq.gz                                                         # Read1
do
  clean=$(echo $file | sed 's/^.\{15\}//g;s/_trimmed//')         # Nombre de la carpeta de salida, mismo nombre de SRA
  file_2=${clean}_2.fastq.gz                                           # Read2
  kallisto quant --index ./align/kallisto/transcripts.idx \
               --output-dir ./kallisto_quant/${clean} \
               --threads 12 ${file} ${file_2}
done

