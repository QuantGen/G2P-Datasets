# Get geno
geno <- read.csv('SNP_for_Publication.csv')
dim(geno)

# Get pheno
pheno <- read.csv('Phen_for_Publication.csv')
head(pheno)

# Get pedigree
ped <- read.csv('Pedigree_for_publication.csv')
head(ped)

# Get map
map <- read.csv("GenTrain_for_Publication.csv")
head(map)