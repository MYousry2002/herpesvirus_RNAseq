#!/bin/bash

VIRUS_GENOMES="../genomes/herpesviruses"
INDEX_DIR="../genomes/herpesviruses/STAR_indices"
THREADS=12

mkdir -p "$INDEX_DIR"

for fasta in "$VIRUS_GENOMES"/*.fasta; do
    virus_name=$(basename "$fasta" .fasta)
    output_dir="${INDEX_DIR}/${virus_name}"
    mkdir -p "$output_dir"
    
    echo "🔧 Building STAR index for $virus_name"
    
    STAR --runThreadN $THREADS \
         --runMode genomeGenerate \
         --genomeDir "$output_dir" \
         --genomeFastaFiles "$fasta" \
         --genomeSAindexNbases 5
done

echo "All viral STAR indices built at: $INDEX_DIR"