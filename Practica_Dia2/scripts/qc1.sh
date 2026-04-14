#!/bin/bash

#SBATCH --job-name=qc1
#SBATCH --output=mnt/data/bioinfo-estadistica-2/RNAseq_2026/BioProject_2026/scripts/out_logs/multiqc_%j.out
#SBATCH --error=mnt/data/bioinfo-estadistica-2/RNAseq_2026/BioProject_2026/scripts/out_logs/multiqc_%j.err
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=4G
#SBATCH --mail-type=END                      # Notificación al finalizar
#SBATCH --mail-user=ecossnav@gmail.com       # Correo de notificación


## --- Analisis de Fastqc ---
# 1. Cargar el módulo de fastqc
module load fastqc/0.11.3

# 2. Correr el analisis
for file in /mnt/data/bioinfo-estadistica-2/RNAseq_2026/BioProject_2026/data/raw/*.fastq.gz; do 
  fastqc $file -o /mnt/data/bioinfo-estadistica-2/RNAseq_2026/BioProject_2026/quality1; 
  done

# ---- Analisis de multiqc ---
# 1. Cargar el módulo de Anaconda
module load anaconda3/2025.06

# 2. Activar el ambiente específico dentro de Anaconda
source activate multiqc-1.5

# 3. Ejecutar el comando dentro del ambiente
multiqc /mnt/data/bioinfo-estadistica-2/RNAseq_2026/BioProject_2026/data/raw \
       -o /mnt/data/bioinfo-estadistica-2/RNAseq_2026/BioProject_2026/quality1
