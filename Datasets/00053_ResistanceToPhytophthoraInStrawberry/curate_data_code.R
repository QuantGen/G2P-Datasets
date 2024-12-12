# Match IDs
IDs <- intersect(pheno[,1], geno[,1])

# Reformat geno
geno <- geno[match(IDs, geno[,1]), -1]
rownames(geno) <- IDs
class(geno) <- 'numeric'

# Reformat pheno
for (i in 6:13) pheno[,i] <- as.numeric(pheno[,i])
pheno <- data.frame(id = pheno[,1], pheno = rowSums(pheno[,6:13]))

pheno <- pheno[match(IDs, pheno$id),]

