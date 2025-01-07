# Reformat geno
geno2 <- t(geno[,-1])
geno3 <- list()
for (i in which(1:ncol(geno2) %% 2 == 1)) {
  tmp <- paste0(geno2[,i], geno2[,i+1])
  tmp[grep('failed', tmp)] <- NA
  geno3[[length(geno3) + 1]] <- tmp
}
geno3 <- do.call(cbind, geno3)
rownames(geno3) <- rownames(geno2)

for (i in 1:ncol(geno3)) {
  col <- geno3[,i]
  unique <- unique(col)
  alleles <- unique(unlist(strsplit(unique, '')))
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

# Calculate marginal means
library(lme4)
library(lsmeans)
pheno$year <- as.character(pheno$year)
pheno$loc <- as.character(pheno$loc)
pheno$f2.2 <- as.numeric(pheno$f2.2)

mod <- lmer(f2.2 ~ line + (1|year) + (1|loc), data = pheno)
blue <- as.data.frame(lsmeans::lsmeans(mod, 'line'))
pheno <- data.frame(id = as.character(blue$line), pheno = blue$lsmean)

# Match IDs
IDs <- intersect(rownames(geno), pheno$id)
geno <- geno[IDs,]
pheno <- pheno[match(IDs, pheno$id),]


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
