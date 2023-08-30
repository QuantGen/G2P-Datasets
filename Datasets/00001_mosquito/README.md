**Dataset title:** Yellow Fever Mosquito

**DOI:** https://doi.org/10.5061/dryad.8gtht76m8 

**Download instrucctions:**

- Download data from: [https://datadryad.org/stash/dataset/doi:10.5061/dryad.8gtht76m8](https://datadryad.org/stash/dataset/doi:10.5061/dryad.5x69p8d5j)
- Unzip file: doi_10.5061_dryad.5x69p8d5j__v2.zip
  
**R script to format data:**

```R
if (!requireNamespace('BiocManager', quietly = TRUE)) {
  install.packages('BiocManager')
  BiocManager::install('snpStats')
  BiocManager::install('skater')
}

bed_file <- 'DatasetS2_NorthAmericaCombinedSnps_reorder.bed'
bim_file <- 'DatasetS2_NorthAmericaCombinedSnps_reorder.bim'
fam_file <- 'DatasetS2_NorthAmericaCombinedSnps_reorder.fam'

geno <- snpStats::read.plink(bed = bed_file, bim = bim_file, fam = fam_file)
```

**Create meta_data.json:**

```R
meta_list <- list (
  Dataset_Folder = '00001_mosquito',
  Scientific_Name = 'Aedes aegypti',
  Common_Name = 'Yellow Fever Mosquito',
  ID = '00001',
  DOI = 'https://doi.org/10.5061/dryad.5x69p8d5j',
  Requires_Authorization = F,
  DNA = T,
  Phenotype = F,
  Map = T,
  Pedigree = T,
  A_Matrix = F,
  GRM = F,
  N_Pheno = 0,
  N_Geno = dim(geno$genotypes)[1],
  N_markers = dim(geno$genotypes)[2]
)

library(jsonlite)
meta_json <- toJSON(meta_list, pretty = TRUE, auto_unbox = TRUE)

# Write
write(meta_json, 'meta_data.json')
```


**Citation(s):**

Pless, E., Powell, J.R., Seger, K.R., Ellis, B. and Gloria‐Soria, A., 2022. Evidence for serial founder events during the colonization of North America by the yellow fever mosquito, Aedes aegypti. Ecology and Evolution, 12(5), p.e8896.
