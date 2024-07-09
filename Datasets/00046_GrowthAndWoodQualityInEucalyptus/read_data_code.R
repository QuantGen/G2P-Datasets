library(data.table)

# Get geno
geno <- fread('Paludeto_et_al_2021_SNPdata.txt')
dim(geno)

# Get pheno
pheno <- fread('Paludeto_et_al_2021_PhenoData.txt')
head(pheno)