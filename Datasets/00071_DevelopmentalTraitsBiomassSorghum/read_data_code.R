library(vcfR)

# Get geno
geno <- read.vcfR('gbs_unimputed_markers.vcf.gz')
dim(geno)

# Get pheno
phenoB16 <- read.csv('Biomass_2016.csv')
phenoH16 <- read.csv('heights_2016.csv')
pheno16 <- merge(phenoB16,phenoH16,by='PlotID')
phenoB17 <- read.csv('Biomass_SF2017.csv')
phenoH17 <- read.csv('heights_SF2017.csv')
pheno17 <- merge(phenoB17,phenoH17,by='PlotID')
pheno16 <- pheno16[,c(1,2,4,5,8:18)]
pheno16$year <- 16
pheno17 <- pheno17[,c(1:4,8:11,17:23,13)]
pheno <- rbind(pheno16,pheno17)
head(pheno)
