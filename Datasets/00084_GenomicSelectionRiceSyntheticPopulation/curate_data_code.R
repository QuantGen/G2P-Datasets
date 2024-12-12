# Match IDs
IDs <- intersect(colnames(geno), pheno$GID)

# Reformat geno
geno2 <- t(geno[, IDs])
alleles <- do.call(rbind, strsplit(geno[,3], ':|>'))[,-1]
for (i in 1:nrow(geno)) {
  a0 <- intersect(unique(geno2[,i]), paste(rep(alleles[i,1], 2), collapse = ''))
  a1 <- intersect(unique(geno2[,i]), paste(alleles[i,], collapse = ''))
  a2 <- intersect(unique(geno2[,i]), paste(rep(alleles[i,2], 2), collapse = ''))
  geno[,i] <- recode_alleles(geno2[,i, drop = F], a0, a1, a2)
}
class(geno2) <- 'numeric'
geno <- geno2

# Reformat pheno
pheno <- cbind(id = IDs, pheno[match(IDs, pheno[,5]), 6:9])
colnames(pheno)[-1] <- paste0('pheno', 1:4)

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