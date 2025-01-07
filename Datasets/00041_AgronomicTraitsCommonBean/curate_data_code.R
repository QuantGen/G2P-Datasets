# Calculate marginal means for each trait under drought
library(lme4)
library(lsmeans)

pheno1 <- pheno[pheno$Management %in% 'Drought',]

mod <- lmer(Yd ~ Line + (1|Trial) + (1|Trial:Block), data = pheno1)
blue <- as.data.frame(lsmeans::lsmeans(mod, 'Line'))

mod1 <- lmer(TSW ~ Line + (1|Trial) + (1|Trial:Block), data = pheno1)
blue1 <- as.data.frame(lsmeans::lsmeans(mod1, 'Line'))

mod2 <- lmer(X100SdW ~ Line + (1|Trial) + (1|Trial:Block), data = pheno1)
blue2 <- as.data.frame(lsmeans::lsmeans(mod2, 'Line'))

imod3 <- lmer(DPM ~ Line + (1|Trial) + (1|Trial:Block), data = pheno1)
blue3 <- as.data.frame(lsmeans::lsmeans(mod3, 'Line'))

# Store all marginal means in the same data frame
IDs <- Reduce(intersect, list(blue[,1], blue1[,1], blue2[,1], blue3[,1], colnames(geno)))
pheno <- data.frame(id = IDs, 
                     pheno = blue$lsmean[match(IDs, blue[,1])], 
                     pheno1 = blue1$lsmean[match(IDs, blue1[,1])], 
                     pheno2 = blue2$lsmean[match(IDs, blue2[,1])], 
                     pheno3 = blue3$lsmean[match(IDs, blue3[,1])])
# Reformat geno
geno <- recode_alleles(t(geno[, IDs]), a0 = '0|0', a1 = c('1|0', '0|1'), a2 = '1|1')

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