library(data.table)

# Get geno
geno <- fread('GBS_Markers_Sorghum_116128_n=320_Inds.txt1.hmp.txt')
dim(geno)

# Get pheno
pheno <- fread('BrownSAP2008_Inflorescence_for_TASSELGBS_NAMES.txt')
head(pheno)
