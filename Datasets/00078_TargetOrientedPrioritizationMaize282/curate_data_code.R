# Match IDs
IDs <- intersect(pheno$line, colnames(geno))

# Reformat geno
geno <- t(geno[, match(IDs, colnames(geno))])
class(geno) <- 'numeric'

# Reformat pheno
pheno <- pheno[match(IDs, pheno$line),]
colnames(pheno) <- c('id', paste0('pheno', 1:(ncol(pheno)-1)))

