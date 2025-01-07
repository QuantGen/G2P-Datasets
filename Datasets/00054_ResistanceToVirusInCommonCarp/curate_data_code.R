# Match IDs
IDs <- intersect(pheno$Id, geno[,1])

# Reformat geno
geno <- geno[match(IDs, geno[,1]),-1]
rownames(geno) <- IDs
class(geno) <- 'numeric'

# Reformat pheno
pheno <- cbind(id = IDs, pheno[match(IDs, pheno$Id), 2:4])
