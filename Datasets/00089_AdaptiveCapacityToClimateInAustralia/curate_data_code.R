# Match IDs in geno and IDs in pheno
rownames(geno) <- paste0('ID', 1:nrow(geno))
pheno <- data.frame(id = rownames(geno), pheno = pheno[,1]) 

