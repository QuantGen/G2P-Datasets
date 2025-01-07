# Match IDs
IDs <- intersect(colnames(geno), pheno$taxa)

# Reformat geno
geno <- t(geno[, match(IDs, colnames(geno))])
rownames(geno) <- IDs
alleles <- do.call(rbind, strsplit(geno[,2], '/'))
for (i in 1:nrow(geno)) {
  aNA <- intersect(unique(geno[,i]), 'NN')
  a0 <- intersect(unique(geno[,i]), paste(rep(alleles[i,1], 2), collapse = ''))
  a1 <- intersect(unique(geno[,i]), paste(alleles[i,], collapse = ''))
  a2 <- intersect(unique(geno[,i]), paste(rep(alleles[i,2], 2), collapse = ''))
  geno[,i] <- recode_alleles(geno[,i, drop = F], a0, a1, a2)
}
class(geno) <- 'numeric'

pheno <- data.frame(id = IDs, pheno1 = pheno[match(IDs, pheno$taxa), 2], 
                     pheno2 = pheno[match(IDs, pheno$taxa), 3])

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