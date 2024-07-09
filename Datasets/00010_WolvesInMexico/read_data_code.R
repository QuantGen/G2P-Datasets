# Get geno
library(trio)
library(BGLR)
out <- read_ped('MERGED.clean.pruned.ped')
p <- out$p
n <- out$n
out <- out$x
out[out==2] <- NA
out[out==3] <- 2
X <- matrix(out, nrow = p, ncol = n, byrow = TRUE)
geno <- t(X)
tmp <- data.table::fread('MERGED.clean.pruned.ped', sep = ' ')
rownames(geno) <- tmp$V2
dim(geno)

# Get map
map <- read.table('MERGED.clean.pruned.map', col.names = c('chromosome', 'name', 'value', 'bp'))
head(map)
