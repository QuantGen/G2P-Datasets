y <- pheno[, 1]
geno2 <- geno[!is.na(y),]
y <- y[!is.na(y)]

# Determine response type
ytype <- ifelse(length(unique(y)) < 10, 'ordinal', 'gaussian')

# if it is ordinal
if (ytype == 'ordinal') y <- as.integer(factor(y)) - 1
yNA <- y

LP <- list(list(X = geno2, model = 'BayesB'))

mod0 <- BGLR(y = yNA, ETA = LP, nIter = 15000, burnIn = 1500, response_type = ytype, verbose = F)