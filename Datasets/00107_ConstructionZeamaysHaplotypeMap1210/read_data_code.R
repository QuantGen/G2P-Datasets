library(vcfR)

# Get geno
geno <- data.frame()
for (i in c(1:10)) {
  path <- gsub(' ','',paste('merged_flt_c',i,'.vcf.gz'))
  geno <- rbind(geno,read.vcfR(path))
}
dim(geno)

