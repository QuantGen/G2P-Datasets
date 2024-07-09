library(data.table)
library(readxl)

# Get geno
geno <- data.frame()
for (i in c(0:8)) {
  path <- gsub(' ','',paste('Cultivated_Ca',i,'.hmp.txt.gz'))
  geno <- rbind(geno,fread(path))
}
dim(geno)

# Get pheno
pheno <- read_xlsx('3000_Phenotyping_data_QC.xlsx',sheet = 1)
head(pheno)
