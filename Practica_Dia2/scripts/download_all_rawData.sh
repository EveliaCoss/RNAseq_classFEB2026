#!/bin/bash

#SBATCH --job-name=DownloadData              # Nombre del trabajo
#SBATCH --output=/mnt/data/bioinfo-estadistica-2/RNAseq_2026/BioProject_2026/scripts/out_logs/DownloadData_%j.out
#SBATCH --error=/mnt/data/bioinfo-estadistica-2/RNAseq_2026/BioProject_2026/scripts/out_logs/DownloadData_%j.err
#SBATCH --ntasks=1                           # Solo una tarea
#SBATCH --cpus-per-task=1                    # Un núcleo
#SBATCH --mem=2G                             # Memoria pequeña, suficiente para wget
#SBATCH --mail-type=END                      # Notificación al finalizar
#SBATCH --mail-user=ecossnav@gmail.com       # Correo de notificación

# Usa el shell bash

# Cargar entorno de módulos si es necesario
. /etc/profile.d/modules.sh

# Cambiar al directorio de trabajo
cd /mnt/data/bioinfo-estadistica-2/RNAseq_2026/BioProject_2026/data/

# Comandos de descarga
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR271/085/SRR27190685/SRR27190685_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR271/084/SRR27190684/SRR27190684_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR271/008/SRR27190708/SRR27190708_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR271/076/SRR27190676/SRR27190676_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR271/010/SRR27190710/SRR27190710_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR271/084/SRR27190684/SRR27190684_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR271/000/SRR27190700/SRR27190700_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR271/008/SRR27190708/SRR27190708_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR271/010/SRR27190710/SRR27190710_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR271/076/SRR27190676/SRR27190676_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR271/085/SRR27190685/SRR27190685_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR271/000/SRR27190700/SRR27190700_2.fastq.gz

