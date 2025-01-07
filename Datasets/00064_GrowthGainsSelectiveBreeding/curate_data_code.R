# Match IDs
IDs <- intersect(geno[,2], pheno$Internal_ID)

# Reformat geno
geno <- geno[match(IDs, geno[,2]),-(1:2)]
rownames(geno) <- IDs

geno3 <- list()
for (i in which(1:ncol(geno) %% 2 == 1)) 
  geno3[[length(geno3) + 1]] <- paste0(geno[,i], geno[,i+1])
geno3 <- do.call(cbind, geno3)

for (i in 1:ncol(geno3)) {
  icol <- geno3[,i]
  iunique <- unique(icol)
  alleles <- unique(unlist(strsplit(iunique, '')))
  alleles <- alleles[!alleles %in% c('0', '-', '9')]
  if (length(alleles) > 1) {
    a0 <- paste(rep(alleles[1], 2), collapse = '')
    a1 <- paste(alleles, collapse = '')
    a2 <- paste(rep(alleles[2], 2), collapse = '')
    geno3[,i] <- recode_alleles(geno3[,i, drop = F], a0, a1, a2)
  } else {
    geno3[,i] <- NA
  }
}
class(geno3) <- 'numeric'
geno <- geno3

pheno <- cbind(id = IDs, pheno[match(IDs, pheno$Internal_ID), 11:ncol(pheno)])
colnames(pheno)[-1] <- paste0('pheno', 1:20)

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