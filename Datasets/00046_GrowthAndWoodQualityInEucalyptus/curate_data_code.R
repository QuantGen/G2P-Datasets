# Rerformat geno
geno <- t(geno[,-1])
for (i in 1:ncol(geno)) {
  col <- geno[,i]
  unique <- unique(col)
  alleles <- unique(unlist(strsplit(unique, '')))
  alleles <- alleles[!alleles %in% '-']
  if (length(alleles) != 1) {
    a0 <- paste(rep(alleles[1], 2), collapse = '')
    a1 <- paste(alleles, collapse = '')
    a2 <- paste(rep(alleles[2], 2), collapse = '')
    geno[,i] <- recode_alleles(geno[,i, drop = F], a0, a1, a2)
  } else {
    geno[,i] <- NA
  }
}
class(geno) <- 'numeric'

# Match IDs
IDs <- intersect(rownames(geno), pheno$Geno_ID)

# Reformat pheno
pheno <- cbind(id = IDs, pheno[match(IDs, pheno[,1]), 5:9])
colnames(pheno)[-1] <- paste0('pheno', 1:5)

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