install.packages(pkg='BGLR',repos='https://cran.r-project.org/')
install.packages('BGData')

library(tidyverse)
library(BGLR)
library(data.table)
library(BGData)

# load data
load(list.files(path = "../input", recursive = T, full.names = T, pattern = ".rdata")[1])

# Impute genotypes
geno <- preprocess(geno, center = T, impute = T)

# Take the first trait on the phenotype data frame
y <- pheno[, 2]

# Remove NAs
geno <- geno[!is.na(y),]
yNA <- y <- y[!is.na(y)]

# Partition 80% TRN-TST
trn <- sample(seq_along(y), as.integer(length(y) * .8))
tst <- setdiff(seq_along(y), trn)
yNA[-trn] <- NA

# Set model choice and hyperparameters
model <- 'GBLUP'
nIter <- 150
burnIn <- 15

if (model == 'GBLUP') {
  G <- getG(geno)
  EVD <- eigen(G)
  PC <- EVD$vectors
  for (i in 1:ncol(PC)) PC[, i] <- PC[, i] * sqrt(EVD$values[i])
  PC <- PC[, EVD$values > 1e-5]
  LP <- list(pc = list(X = PC, model = 'BRR'))
}

# Saving on a temporary directory
PWD <- getwd()
setwd(tempdir())

# Running the model
mod0 <- BGLR(y = yNA, ETA = LP, nIter = nIter, burnIn = burnIn, verbose = F)

# Coming back to the original directory
setwd(PWD)

# Prediction Ability for this sample
PA <- cor(y[-trn], mod0$yHat[-trn])
plot(cor(y, mod0$yHat), main = PA)