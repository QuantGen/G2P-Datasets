# Match IDs
IDs <- intersect(colnames(geno), pheno$Taxa)

# Reformat geno
geno <- t(geno[, match(IDs, colnames(geno))])
rownames(geno) <- IDs

for (i in 1:ncol(geno)) {
  col <- geno[,i]
  col[col %in% 'N'] <- NA
  geno[,i] <- (as.numeric(as.factor(col)) - 1) * 2
}
class(geno) <- 'numeric'

pheno <- data.frame(id = IDs, pheno1 = pheno[match(IDs, pheno$Taxa), 2], 
                     pheno2 = pheno[match(IDs, pheno$Taxa), 3])
