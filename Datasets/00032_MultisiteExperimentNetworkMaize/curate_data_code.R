# Calculate marginal means for each trait
library(lme4)
library(lsmeans)

mod_formula <- '~ Variety_ID + treatment + (1|Site) + (1|year) + (1|Site:Row) + (1|Site:Column)'
traits <- c('plant.height', 'tassel.height', 'ear.height', 'anthesis', 'silking', 'anthesis.silking.interval',
            'grain.yield', 'grain.weight')

mmeans <- list()
for (i in traits) {
  imod <- lmer(as.formula(paste(i, mod_formula)), data = pheno)
  mmeans[[length(mmeans) + 1]] <- as.data.frame(lsmeans::lsmeans(imod, 'Variety_ID'))
}

# Reformat geno
rownames(geno) <- geno[,1]
geno <- geno[,-1]

# Store all marginal means in the same dataframe
IDs <- Reduce(intersect, c(lapply(mmeans, function(x) x[,1]), list(rownames(geno))))
pheno <- cbind(id = IDs, as.data.frame(sapply(mmeans, function(x) x$lsmean[match(IDs, x[,1])])))
colnames(pheno)[-1] <- paste0('pheno', 1:(ncol(pheno)-1))

geno <- geno[IDs,]
class(geno) <- 'numeric'
