# Calculate marginal means for each trait
library(lme4)
library(lsmeans)

mod_formula <- '~ strain + (1|environ)'
traits <- c('yield', 'protein', 'oil', 'size')

mmeans <- list()
for (i in traits) {
  mod <- lmer(as.formula(paste(i, mod_formula)), data = pheno)
  mmeans[[length(mmeans) + 1]] <- as.data.frame(lsmeans::lsmeans(mod, 'strain'))
}

# Match IDs
IDs <- intersect(pheno$strain, rownames(geno))
geno <- geno[IDs, ]

# Store all marginal means in the same dataframe
IDs <- Reduce(intersect, c(lapply(mmeans, function(x) x[,1]), list(rownames(geno))))
pheno <- cbind(id = IDs, as.data.frame(sapply(mmeans, function(x) x$lsmean[match(IDs, x[,1])])))
colnames(pheno)[-1] <- paste0('pheno', 1:(ncol(pheno)-1))

