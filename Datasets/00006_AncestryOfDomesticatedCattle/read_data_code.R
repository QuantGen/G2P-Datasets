# Read data
# BiocManager::install('trio', force = TRUE)

# Get ped
ped <- trio::read.pedfile('ww_cattle_dryad_20Sept2013.ped')
ped[1:10,1:10]

# Get geno
geno <- ped[,7:ncol(ped)]
rownames(geno) <- ped$pid
dim(geno)

# Get map
map <- read.table('ww_cattle_dryad_20Sept2013.map', col.names = c('chr', 'mar', 'c0', 'bp'))
colnames(geno) <- map$bp
head(map)

# Get pheno
pheno <- read.table('ww_cattle_dryad_20Sept2013.pedind', 
                    col.names = c('code', 'ID', 'c0', 'c1', 'c2', 'breed'))
head(pheno)
