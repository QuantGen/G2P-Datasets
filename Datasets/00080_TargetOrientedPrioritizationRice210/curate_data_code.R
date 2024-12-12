# Match IDs
IDs <- intersect(pheno$RIL, colnames(geno))

# Reformat geno
geno <- t(geno[,-1])
class(geno) <- 'numeric'
geno <- geno * 2
geno <- geno[IDs,]

# Reformat pheno
pheno <- pheno[match(IDs, pheno$RIL), c(1, 3:6)]
colnames(pheno) <- c('id', paste0('pheno', 1:4))
