# Calculate marginal means for each trait
library(lme4)
library(lsmeans)
mod_formula <- '~ Selection + (1|Location) + (1|Year)'
traits <- c('TestWt', 'G_Pro', 'F_Pro', 'MixoAb', 'MixoMT', 'BakeAb', 'BakeMT', 'Volume')

mmeans <- list()
for (i in traits) {
  mod <- lmer(as.formula(paste(i, mod_formula)), data = pheno)
  mmeans[[length(mmeans) + 1]] <- as.data.frame(lsmeans::lsmeans(mod, 'Selection'))
}

# Store all marginal means in the same data frame
IDs <- Reduce(intersect, c(lapply(mmeans, function(x) x[,1]), list(colnames(geno))))
pheno <- cbind(id = IDs, as.data.frame(sapply(mmeans, function(x) x$lsmean[match(IDs, x[,1])])))
colnames(pheno)[-1] <- paste0('pheno', 1:(ncol(pheno)-1))

# Reformat igeno
geno <- recode_alleles(t(geno[,IDs]), a0 = ' 1', a1 = ' 0', a2 = '-1')

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