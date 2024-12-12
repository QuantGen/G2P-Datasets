# Reformat geno
geno <- t(geno[,-(1:4)])
geno <- geno[which(1:nrow(geno) %% 2 == 1),]
rownames(geno) <- pheno$id
class(geno) <- 'numeric'

# Reformat pheno
pheno <- pheno[, c(1, 7:10)]
colnames(pheno)[-1] <- paste0('pheno', 1:4)
