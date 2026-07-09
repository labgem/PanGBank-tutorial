#!/usr/bin/env bash

pangbank search-pangenomes --collection GTDB_refseq --taxon "s__Acinetobacter baumannii" --download --release-version 2.0.0

ppanggolin info -p ./pangbank/GTDB_refseq_s__Acinetobacter_baumannii_id10832.h5 --content

ppanggolin fasta -p ./pangbank/GTDB_refseq_s__Acinetobacter_baumannii_id10832.h5 \
                 -f --compress --prot_families all -o families_faa_output

amrfinder -p families_faa_output/all_protein_families.faa.gz --plus --threads 8 -o amrfinder_result.tsv

ppanggolin rgp_cluster -p ./pangbank/GTDB_refseq_s__Acinetobacter_baumannii_id10832.h5 \
                       --grr_metric max_grr -o rgp_cluster -f --add_metadata

ppanggolin write_pangenome  --spots --regions --families_tsv --partitions \
                            --regions_families --output ppanggolin_output \
                            --modules --spot_modules  \
                            -p ./pangbank/GTDB_refseq_s__Acinetobacter_baumannii_id10832.h5 -f

sed -i 's/\%/Prct/g' amrfinder_result.tsv
sed -i '1s/ /_/g' amrfinder_result.tsv
sed -i '1s/\<Protein id\>/families/' amrfinder_result.tsv

ppanggolin metadata --pangenome ./pangbank/GTDB_refseq_s__Acinetobacter_baumannii_id10832.h5 --metadata  amrfinder_result.tsv  --source amrfinder --assign families

ppanggolin write_genomes -p ./pangbank/GTDB_refseq_s__Acinetobacter_baumannii_id10832.h5 --genomes GCF_000069245.1 --gff --add_metadata -o ppanggolin_genome_output
