library(vcfR)

# Get geno
geno <- data.frame()
for (i in c(1:10)) {
  path <- gsub(' ','',paste('c',i,'_hmp311_q30.vcf.gz'))
  geno <- rbind(geno,read.vcfR(path))
}
dim(geno)

