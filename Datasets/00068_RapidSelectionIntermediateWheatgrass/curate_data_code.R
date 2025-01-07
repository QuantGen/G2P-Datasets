# Reformat geno
geno <- geno[,-1]
rownames(geno) <- geno[,1]
class(geno) <- 'numeric'
geno <- geno + 1

# Reformat pheno and remove traits with small sample size
pheno <- reshape2::melt(pheno)

pheno <- pheno[!is.na(pheno$value) & !(pheno$value %in% c(0, 1)),]
tmp <- strsplit(as.character(pheno$variable), '_')
pheno$var <- sapply(tmp, function(x) x[1])
pheno$year <- as.character(sapply(tmp, function(x) x[2]))

# Remove traits with small sample size
pheno <- pheno[pheno$var %in% names(sort(table(pheno$var), decreasing = T))[1:3],]

# Calculate marginal means for each trait
library(lme4)
library(lsmeans)

mmeans <- list()
for (i in unique(pheno$var)) {
  mod <- lmer(value ~ entity_id + (1|year), data = pheno[pheno$var %in% i, ])
  mmeans[[length(mmeans) + 1]] <- as.data.frame(lsmeans::lsmeans(mod, 'entity_id'))
}

# match IDs
IDs <- Reduce(intersect, c(list(rownames(geno)), sapply(mmeans, function(x) x[,1])))
pheno <- cbind(id = IDs, as.data.frame(lapply(mmeans, function(x) x[match(IDs, x[,1]), 2])))
colnames(pheno)[-1] <- paste0('pheno', 1:3)

geno <- geno[IDs,]
