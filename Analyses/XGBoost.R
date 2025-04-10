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
# Reproducing Kernel Hilbert Space model (RKHS)
model <- 'XGBoost'
nIter <- 150
burnIn <- 15

if (model == 'XGBoost') {
  library(xgboost)
  # Testing set indexing
  tst <- setdiff(seq_along(y), trn)
  
  # Running the XGBoost model with max_depth = 4 
  GBT <- xgboost(data = geno[trn,], label = y[trn], booster = "gbtree", max_depth = 4,
                 objective = "reg:squarederror", nrounds = 100, verbose = FALSE)
  
  # Prediction ability for this sample 
  yHat <- predict(GBT, newdata = geno[tst,])
  PA <- cor(y[tst], yHat)
}
plot(cor(y, mod0$yHat), main = PA)