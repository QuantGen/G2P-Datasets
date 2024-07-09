library(data.table)

# Get geno
geno = data.frame()
for (i in c(1:10)) {
  strg <- gsub(' ','',paste('chr',i,'_hybrid42K.gt.hmp'))
  temp <- fread(strg)
  geno <- rbind(geno,temp)
}
colnames(geno) <- colnames(temp)
dim(geno)

# Get pheno
phenoZ <- fread('CUBICxJing724_2014_5locs_hybrid.txt')
phenoJ <- fread('CUBICxZheng58_2014_5locs_hybrid.txt')
pheno14 <- rbind(phenoZ,phenoJ)
pheno15 <- fread('Ncii_2015_5locs_hybrids.txt',col.names = c('loc','line','DTT','PH','EW'))[,c(2,1,3,4,5)]
pheno <- rbind(pheno14,pheno15)
head(pheno)

