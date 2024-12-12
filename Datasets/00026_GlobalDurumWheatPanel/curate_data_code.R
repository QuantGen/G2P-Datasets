# Remove NAs
pheno <- pheno[!pheno$MacroAreaCLASSIFICATION %in% 'na',]

# Match IDs
IDs <- intersect(colnames(geno), pheno[,2])

# Reformat geno
geno <- t(geno[, IDs])
geno <- recode_alleles(geno, a0 = 'AA', a1 = c('AB', 'BA'), a2 = 'BB')

# Reformat pheno
pheno <- data.frame(id = IDs, pheno = pheno$MacroAreaCLASSIFICATION[match(IDs, pheno[,2])])

# Making the trait numeric
pheno$pheno <- as.numeric(as.factor(pheno$pheno))

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