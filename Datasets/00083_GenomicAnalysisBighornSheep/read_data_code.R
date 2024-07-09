library(data.table)

# Get geno
geno <- fread('Miller_et_al_Animals_with_phenos_transposed.tped')
dim(geno)

# Get pheno
pheno <- fread('Miller_et_al_Base_Circ_Typed_IDs_Only_No_Dupes.txt')
head(pheno)

# Get map
map <- fread('Miller_et_al_Animals_with_phenos_transposed.tfam')
head(map)
