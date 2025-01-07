# Reformat geno
geno <- t(geno[, -(1:3)])
class(geno) <- 'numeric'

# Match IDs
IDs <- intersect(rownames(geno), pheno$Sample)

geno <- geno[IDs,]

# Reformat pheno
pheno <- pheno[match(IDs, pheno$Sample), 1:ncol(pheno)]
colnames(pheno) <- c('id', paste0('pheno', 1:8))
