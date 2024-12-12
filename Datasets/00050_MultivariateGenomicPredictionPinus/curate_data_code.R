# Match IDs
IDs <- intersect(pheno[,1], geno[,1])

# Reformat geno
geno <- geno[match(IDs, geno[,1]),-1]
rownames(geno) <- IDs
class(geno) <- 'numeric'
geno <- geno + 1

# Reformat pheno
pheno <- cbind(id = IDs, pheno[match(IDs, pheno[,1]), 5:11])
colnames(pheno)[-1] <- paste0('pheno', 1:7)

# Traits must be numeric
for (i in 2:ncol(pheno)) pheno[,i] <- as.numeric(as.character(pheno[,i]))

