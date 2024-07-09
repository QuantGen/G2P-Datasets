library(data.table)
library(readxl)

# Get geno
geno <- fread('File S5.txt')
dim(geno)

# Get map
map <- read_excel('1273_files1.xlsx')
head(map)