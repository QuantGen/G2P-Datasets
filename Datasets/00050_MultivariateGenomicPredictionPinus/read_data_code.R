# Get geno
geno <- read.csv("Pinus_SNPdata.csv")
dim(geno)

# Get pheno
pheno_pinus <- read.csv("Pinus_Penotypic_data.csv")
head(pheno)

# Get pedigree
ped <- read.csv("Pinus_Pedigree.csv")
head(ped)
