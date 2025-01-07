# Calculate marginal means for each trait
library(lme4)
library(lsmeans)
mod_formula <- '~ B3F2mother + (1|Farm) + (1|Farm:Big_Block) + (1|Farm:Big_Block:Little_Block)'

mod <- lmer(as.formula(paste('sg_ep155_composite_length', mod_formula)), data = pheno)
blue <- as.data.frame(lsmeans::lsmeans(mod, 'B3F2mother'))

mod1 <- lmer(as.formula(paste('sg_severity', mod_formula)), data = pheno)
blue1 <- as.data.frame(lsmeans::lsmeans(mod1, 'B3F2mother'))

mod2 <- lmer(as.formula(paste('ep155_severity', mod_formula)), data = pheno)
blue2 <- as.data.frame(lsmeans::lsmeans(mod2, 'B3F2mother'))

mod3 <- lmer(as.formula(paste('sg_ep155_severity', mod_formula)), data = pheno)
blue3 <- as.data.frame(lsmeans::lsmeans(mod3, 'B3F2mother'))

# Reformat IDs in geno
rgeno <- gsub('BAMs/', '', rownames(geno), fixed = T)
rgeno <- gsub('.bam', '', rgeno, fixed = T)
rownames(geno) <- rgeno

# Store all marginal means in the same data frame
IDs <- Reduce(intersect, list(blue[,1], blue1[,1], blue2[,1], blue3[,1], rgeno))
pheno <- data.frame(id = IDs, 
                     pheno = blue$lsmean[match(IDs, blue[,1])], 
                     pheno1 = blue1$lsmean[match(IDs, blue1[,1])], 
                     pheno2 = blue2$lsmean[match(IDs, blue2[,1])], 
                     pheno3 = blue3$lsmean[match(IDs, blue3[,1])])


# Reformat geno
geno <- recode_alleles(geno[IDs,], a0 = '0/0', a1 = c('1/0', '0/1'), a2 = '1/1')

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