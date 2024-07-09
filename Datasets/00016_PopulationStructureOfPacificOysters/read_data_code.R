# install.packages('BiocManager')
# BiocManager::install('trio') 

library(trio)

# Get geno
geno <- read.pedfile('Cgigas_SNPArray.ped')
dim(geno)

# Get map
map <- read.table('Cgigas_SNPArray.map')
head(map)
