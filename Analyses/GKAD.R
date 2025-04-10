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
# Gaussian Kernels average of the distance matrix (GKAD)
model <- 'GKAD'
nIter <- 150
burnIn <- 15

if (model == 'GKAD') {
  
  # Function to get a distance matrix
  cov2dist <- function(COV, asDist = TRUE){
    n <- nrow(COV)
    D <- matrix(nrow = n, ncol = n)
    for (i in 1:n) {
      for (j in i:n) {
        D[i, j] <- COV[i, i] + COV[j, j] - 2 * COV[i, j]
        D[j, i] <- D[i, j]
      }
    }
    
    if(asDist){
      D <- as.dist(D)
    }
    return(D)
  }
  
  G <- getG(geno)
  D <- cov2dist(G, asDist = FALSE)
  
  LP <- list(list(K = exp(-0.5 * D), model = 'RKHS'),
             list(K = exp(-D), model = 'RKHS'),
             list(K = exp(-1.5 * D), model = 'RKHS'))
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