# Get geno
library(data.table)
raw_geno <- fread('Genotypes_422405SNPs_Pop1_2_3.txt', data.table = FALSE)
geno <- matrix(NA, ncol = nchar(raw_geno[1,2]), nrow = nrow(raw_geno))
rownames(geno) <- unname(unlist(raw_geno[, 1]))
for (i in 1:nrow(geno)) geno[i,] <- as.numeric(unlist(strsplit(as.character(raw_geno[i,2]), split = '')))
dim(geno)

# Get pedigree
pop <- fread('ID_Population_Pedigree.txt', col.names = c('ID', 'pop'))
ped <- fread('Pedigree_HF.txt', col.names = c('ID', 'p1', 'p2'))
ped <- merge(ped, pop, by = 'ID')
head(ped)

# Get pheno
pheno <- fread('Phenotypes_QTL_LowMAF/1.SH1.0-0.6/Phenotypes_replicate_1.txt', col.names = c('row', 'pop', 'ID', 'phenotype'))
head(pheno)
