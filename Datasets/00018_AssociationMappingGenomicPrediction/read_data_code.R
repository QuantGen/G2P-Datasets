# Get geno
geno <- read.csv('quality.lines.GBS.numeric.csv')
dim(geno)

# Get pheno
pheno <- read.csv('2015_2017_Master_Quality_With_corrected_names_for_hays_lines.csv')
head(pheno)
