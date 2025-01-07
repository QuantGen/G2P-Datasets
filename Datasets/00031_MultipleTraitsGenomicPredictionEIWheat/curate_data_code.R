# Calculate marginal means
library(lme4)
library(lsmeans)
mod <- lmer(yield ~ line_id + (1|loc) + (1|year), data = pheno)
blue <- as.data.frame(lsmeans::lsmeans(mod, 'line_id'))

mod1 <- lmer(prot ~ line_id + (1|loc) + (1|year), data = pheno)
blue1 <- as.data.frame(lsmeans::lsmeans(mod, 'line_id'))

# Match IDs
IDs <- Reduce(intersect, list(blue[,1], blue1[,1], geno[,1]))

# Reformat pheno
pheno <- data.frame(id = IDs, pheno1 = blue[match(IDs, blue[,1]), 2], 
                     pheno2 = blue1[match(IDs, blue1[,1]), 2])

geno <- geno[match(IDs, geno[,1]), -1]
rownames(geno) <- IDs
class(geno) <- 'numeric'
geno <- geno + 1
