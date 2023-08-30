**Dataset title:** 00001 Yellow Fever Mosquito

**DOI:** https://doi.org/10.5061/dryad.8gtht76m8 

**Download instrucctions:**

- Download data from: https://datadryad.org/stash/dataset/doi:10.5061/dryad.8gtht76m8
- Unzip file: doi_10.5061_dryad.8gtht76m8__v2.zip
- Site abbreviations (in pedigree) file: Site_List_FL_SCA_SNPs.xlsx
  
**R script to format data:**

```R
if (!requireNamespace("BiocManager", quietly = TRUE)) {
  install.packages("BiocManager")
  BiocManager::install("snpStats")
  BiocManager::install("skater")
}

library(snpStats)
library(skater)

map_file <- "UnfilteredSNPs_FL_SCA.map"
ped_file <- "UnfilteredSNPs_FL_SCA.ped"

ped <- read.pedfile(file = ped_file)
map <- read_map(file = map_file)
```

**Create meta_data.json:**

```R
meta_list <- list (
  Dataset_Folder = '00001_mosquito',
  Scientific_Name = 'Aedes aegypti',
  Common_Name = 'Yellow Fever Mosquito',
  ID = '00001',
  DOI = 'https://doi.org/10.5061/dryad.8gtht76m8',
  Requires_Authorization = F,
  DNA = T,
  Phenotype = F,
  Map = T,
  Pedigree = T,
  A_Matrix = F,
  GRM = F,
  N_Pheno = 156,
  N_Geno = 50000
)

library(jsonlite)
meta_json <- toJSON(meta_list, pretty = TRUE, auto_unbox = TRUE)

# Write
write(meta_json, "meta_data.json")

# Read
meta_json <- read_json("meta_data.json")
```


**Citation(s):**
