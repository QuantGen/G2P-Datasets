# Get geno
geno <- read.csv('SNP_Kinleith2_release.csv')
dim(geno)

# Get pheno
pheno <- read.csv('Phenotype_Kinleith2_release.csv')
head(pheno)

# Get ped
ped <- read.csv('Pedigree_Kinleith2_release.csv')
head(ped)
