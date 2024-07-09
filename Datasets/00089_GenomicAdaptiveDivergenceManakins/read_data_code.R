library(Rsamtools)

# Get geno
bam <- BamFile('manacus_parchman.bam')
geno <- scanBam(BamFile('manacus_parchman.bam'))[[1]]$seq
length(geno)
