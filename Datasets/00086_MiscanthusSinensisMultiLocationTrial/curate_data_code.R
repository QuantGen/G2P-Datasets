# Obtain Marginal means
library(lme4)
library(lsmeans)
mod <- lmer(Survival.spring.year.2 ~ Entry + (1|Trial), data = pheno)
blue <- as.data.frame(lsmeans::lsmeans(mod, 'Entry'))

# Match IDs
IDs <- intersect(geno[,1], blue[,1])

# Reformat pheno
pheno <- data.frame(id = IDs, pheno = blue[match(IDs, blue[,1]), 2])

# Reformat geno
geno <- geno[match(IDs, geno[,1]),-1]
rownames(geno) <- IDs
class(geno) <- 'numeric'
