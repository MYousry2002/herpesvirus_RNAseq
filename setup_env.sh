#!/bin/bash

# Create the conda environment
conda create -n herpesvirus -y \
    -c bioconda -c conda-forge \
    entrez-direct star samtools hisat2 fastqc

# Activate the environment
conda init
conda activate herpesvirus

# Confirm installed packages
echo "Environment 'herpesvirus' is ready with the following tools:"
conda list | grep -E 'entrez|star|samtools|hisat2|fastqc'