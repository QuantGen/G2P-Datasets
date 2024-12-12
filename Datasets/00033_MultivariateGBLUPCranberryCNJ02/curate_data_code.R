# Calculate marginal means
library(lme4)
library(lsmeans)
mod <- lmer(yield ~ id + (1|yearf) + (1|yearf:Rowf) + (1|yearf:Colf), data = pheno)
blue <- as.data.frame(lsmeans::lsmeans(mod, 'id'))
pheno <- data.frame(id = as.character(blue$id), pheno = blue$lsmean)

# Reformat geno
geno <- t(geno[,-(1:5)])
for (i in 1:ncol(geno)) {
  icol <- as.numeric(as.factor(geno[,i]))
  geno[,i] <- icol
}

class(geno) <- 'numeric'

# Match IDs
IDs <- intersect(pheno[,1], rownames(geno))
pheno <- pheno[match(IDs, pheno[,1]),]
geno <- geno[match(IDs, rownames(geno)),]
