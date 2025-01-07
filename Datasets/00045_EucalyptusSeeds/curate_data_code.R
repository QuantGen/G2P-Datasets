# Match IDs
IDs <- intersect(pheno$TreeID, geno[,1])

geno <- geno[match(IDs, geno[,1]), -1]
geno <- recode_alleles(geno, a0 = 'AA', a1 = c('AB', 'BA'), a2 = 'BB')

pheno <- ipheno[match(IDs, pheno$TreeID), 5:ncol(pheno)]
colnames(pheno) <- paste0('pheno', 1:ncol(pheno))
pheno <- cbind(id = IDs, ipheno)

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