# Match IDs of pheno and geno
IDs <- intersect(rownames(geno), pheno$ID)

# Reformat geno and pheno
geno <- geno[IDs,]
pheno <- cbind(id = IDs, pheno[match(IDs, pheno$ID), 3:6])
colnames(pheno)[-1] <- paste0('pheno', 1:(ncol(pheno)-1))
for (i in 2:ncol(pheno)) pheno[,i] <- as.numeric(pheno[,i])

# Format geno
geno <- recode_alleles(geno, a0 = '0/0', a1 = c('1/0', '0/1'), a2 = '1/1')

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
