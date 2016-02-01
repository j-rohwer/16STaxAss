#!/bin/bash

pident=("100" "99" "98" "97" "96" "95" "94")

# Rscript filter_seqIDs_by_pident.R otus.custom.blast.table.modified ids.above.95 95 TRUE 
# Rscript filter_seqIDs_by_pident.R otus.custom.blast.table.modified ids.below.95 95 FALSE
# RScript plot_blast_hit_stats.R otus.custom.blast.table.modified 95 plots
# cat ids.below.95 ids.missing > ids.below.95.all
# python create_fastas_given_seqIDs.py ids.above.95 otus.fasta otus.above.95.fasta
# python create_fastas_given_seqIDs.py ids.below.95.all otus.fasta otus.below.95.fasta
# mothur "#classify.seqs(fasta=otus.above.95.fasta, template=custom.fasta,  taxonomy=custom.taxonomy, method=wang, probs=T, processors=2)"
# mothur "#classify.seqs(fasta=otus.below.95.fasta, template=general.fasta, taxonomy=general.taxonomy, method=wang, probs=T, processors=2)"
# cat otus.above.95.custom.wang.taxonomy otus.below.95.general.wang.taxonomy > otus.95.taxonomy
# sed 's/[[:blank:]]/\;/' <otus.95.taxonomy >otus.95.taxonomy.reformatted
# mv otus.95.taxonomy.reformatted otus.95.taxonomy
# mkdir conflicts_95
# Rscript find_classification_disagreements.R otus.95.taxonomy otus.general.taxonomy ids.above.95 conflicts_95 95 70




# Now run step 13- plotting everything together to choose final pident

args_string=""
for p in ${pident[*]}
do
   args_string+=" conflicts_$p ids.above.$p $p"
done

Rscript plot_classification_disagreements.R otus.abund plots conflicts_database $args_string

printf 'Steps 1-13 have finished running.  Now analysze the plots from step 13 to choose your final pident and generate your final taxonomy file in step 14.  Then tidy up your working directory with step 15. \n \a'
sleep .1; printf '\a'; sleep .1; printf '\a'; sleep .1; printf '\a'; sleep .1; printf '\a'; sleep .1; printf '\a'; 

exit 0
