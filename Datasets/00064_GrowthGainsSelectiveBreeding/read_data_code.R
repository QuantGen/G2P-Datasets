library(data.table)

# Get geno
geno1 <- fread('MacLachlan_etal.(2017)_AdmixtureProjectedIndivs_SNPpedfile_June9th2017.csv')
geno2 <- fread('MacLachlan_etal.(2017)_AdmixtureRefernceIndivs_SNPpedfile_June9th2017.csv')
geno <- rbind(geno1,geno2)
dim(geno)

# Get pheno
pheno <- fread('MacLachlan_etal.(2017)_PhenotypicData_June9th2017.csv')
head(pheno)

# Get map
map <- fread('MacLachlan_etal.(2017)_SNPmapfile_June9th2017.csv')
head(map)
