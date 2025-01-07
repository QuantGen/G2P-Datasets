# Calculate marginal means for each trait
library(lme4)
library(lsmeans)

mod_formula <- '~ ID + (1|Experiment) + (1|Year)'
traits <- c("LY_adjust", "LP_adjust", "LEN_adjust", "STR_adjust", "EL_adjust", "MIC_adjust", "UNI_adjust", "SFI_adjust")

mmeans <- list()
for (i in traits) {
  mod <- lmer(as.formula(paste(i, mod_formula)), data = pheno)
  mmeans[[length(mmeans) + 1]] <- as.data.frame(lsmeans::lsmeans(mod, 'ID'))
}

# Reformat geno
rownames(geno) <- geno[,1]
geno <- geno[,-1]
class(geno) <- 'numeric'
geno <- geno + 1

# Store all marginal means in the same data frame
IDs <- Reduce(intersect, c(lapply(mmeans, function(x) x[,1]), list(rownames(geno))))
pheno <- cbind(id = IDs, as.data.frame(sapply(mmeans, function(x) x$lsmean[match(IDs, x[,1])])))
colnames(pheno)[-1] <- paste0('pheno', 1:(ncol(pheno)-1))

geno <- geno[IDs,]
