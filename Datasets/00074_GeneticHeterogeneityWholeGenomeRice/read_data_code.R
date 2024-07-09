library(data.table)

# Get geno
geno <- fread('sativas413.ped')
dim(geno)

# Get pheno
pheno <- fread('RiceDiversity_44K_Phenotypes_34traits_PLINK.txt')
head(pheno)

# Get map
map <- fread('sativas413.map')
head(map)
