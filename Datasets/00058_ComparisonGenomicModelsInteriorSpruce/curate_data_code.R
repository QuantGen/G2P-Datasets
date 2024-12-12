# Match geno and pheno IDs
IDs <- intersect(pheno$ID, geno[,1])

# Reformat pheno data
pheno <- cbind(id = IDs, pheno[match(IDs, pheno$ID), 5:10])
colnames(pheno)[-1] <- paste0('pheno', 1:(ncol(pheno)-1))

geno <- igeno[match(IDs, geno[,1]),-1]
class(geno) <- 'numeric'
geno <- geno + 1
