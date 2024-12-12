# Match IDs in geno with IDs in pheno
c1 <- sapply(strsplit(rownames(geno), '_'), function(x) x[1])
c2 <- sapply(strsplit(rownames(geno), '_'), function(x) x[2])
m1 <- match(pheno$id, c1)
m2 <- match(pheno$id, c2)
m1[is.na(m1)] <- m2[is.na(m1)]

# Create a dataframe with ID and pheno
pheno <- pheno[m1, c('id', 'pheno')]
rownames(geno) <- pheno$id

