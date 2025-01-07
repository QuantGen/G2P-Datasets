# Match IDs
IDs <- intersect(pheno[,1], geno[,1])

# Reformat geno
geno <- geno[match(IDs, geno[,1]), -1]
rownames(geno) <- IDs
class(geno) <- 'numeric'

# Reformat pheno
pheno <- data.frame(id = IDs, pheno = pheno[match(IDs, pheno[,1]), 3], 
                     pheno1 = pheno[match(IDs, pheno[,1]), 4])
