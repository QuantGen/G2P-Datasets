                         
# Get geno
geno <- read.csv('markers.csv')
dim(geno)

# Get pheno
pheno <- read.csv('trait_data.csv')
head(pheno)

# Get map
map <- read.csv('map.csv')
head(map)
