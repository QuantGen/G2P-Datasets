library(data.table)

# Get geno
geno <- fread('full_dataset.snps',header = TRUE,col.names = c('ID','Markers'))
dim(geno)
nchar(geno[1, 2])

# Get pheno
pheno1 <- fread('leaf_traits_measurements.tsv')
colnames(pheno1)[1] <- 'species'
pheno2 <- fread('tree_accessions.txt')
pheno <- merge(pheno1,pheno2,by='species')
head(pheno)

# Get map
map <- fread('full_dataset.snpsmap')
head(map)
