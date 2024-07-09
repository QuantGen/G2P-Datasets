# Get geno
geno <- data.frame()
for (i in c(1:10)) {
  str <- gsub(' ','',paste('Parents26_chr',i,'.RData'))
  load(str) 
  geno <- rbind(geno,temp)
}
colnames(geno) <- colnames(temp)
dim(geno)

# Get map
load('Map.RData')
head(Map)
