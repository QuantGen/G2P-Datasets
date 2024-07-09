library(data.table)

# Get geno
geno <- fread('MET_crfilt_.75_allchrom.hmp.txt')
dim(geno)

# Get pheno
cols <- c('GHID','YEAR','SEASON','REP','PLOTNO','FL','MAT','LDG','Plot_Yld','Kg_ha')
pheno1 <- read.csv('data/corrected_RYT2009DS_plotdata_by_GHID.csv')[,cols]
pheno2 <- read.csv('data/corrected_RYT2009DS_plotdata_by_GHID.csv')[,cols]
pheno3 <- read.csv('data/corrected_RYT2009DS_plotdata_by_GHID.csv')[,cols]
pheno4 <- read.csv('data/corrected_RYT2009DS_plotdata_by_GHID.csv')[,cols]
pheno5 <- read.csv('data/corrected_RYT2009WS_plotdata_by_GHID.csv')[,cols]
pheno6 <- read.csv('data/corrected_RYT2009WS_plotdata_by_GHID.csv')[,cols]
pheno7 <- read.csv('data/corrected_RYT2009WS_plotdata_by_GHID.csv')[,cols]
pheno8 <- read.csv('data/corrected_RYT2009WS_plotdata_by_GHID.csv')[,cols]
pheno <- rbind(pheno1,pheno2,pheno3,pheno4,pheno5,pheno6,pheno7,pheno8)
head(pheno)
