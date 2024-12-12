# Match IDs
IDs <- intersect(pheno[,1], geno[,1])

# Reformat geno
geno <- geno[match(IDs, geno[,1]),-1]
rownames(geno) <- IDs

geno <- recode_alleles(geno, a0 = -1, a1 = 0, a2 = 1)

# Reformat pheno
pheno <- cbind(id = IDs, pheno[match(IDs, pheno[,1]), 5:11])
colnames(pheno)[-1] <- paste0('pheno', 1:7)

# Traits must be numeric
for (i in 2:ncol(pheno)) pheno[,i] <- as.numeric(as.character(pheno[,i]))

recode_alleles <- function(geno, a0, a1, a2) {
  for (j in 1:ncol(geno)) {
    jal <- geno[,j]
    geno[jal %in% a0, j] <- 0
    geno[jal %in% a1, j] <- 1
    geno[jal %in% a2, j] <- 2
    geno[!(jal %in% c(a0, a1, a2)), j] <- NA
  }
  class(geno) <- 'numeric'
  return(geno)
}