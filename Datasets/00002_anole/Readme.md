**Dataset title:** Green anole

**DOI:** https://doi.org/10.5061/dryad.qbzkh18ks

**Download instrucctions:**

- Download data from: [https://datadryad.org/stash/dataset/doi:10.5061/dryad.qbzkh18ks](https://datadryad.org/stash/dataset/doi:10.5061/dryad.qbzkh18ks)
- Unzip file: doi_10.5061_dryad.qbzkh18ks__v9.zip
  
**R script to format data:**

```R
if (!requireNamespace('vcfR', quietly = TRUE)) install.packages('vcfR')

vcf_file <- '94_44K_ALL_V.vcf'
pheno_file <- 'Supplemental_Sample_description.txt'

geno <- vcfR::read.vcfR(vcf_file)
pheno <- read.delim(pheno_file, sep = '\t', header = T, skip = 1)
```

**Create meta_data.json:**

```R
meta_list <- list (
  Dataset_Folder = '00002_anole',
  Scientific_Name = 'Anolis carolinensis',
  Common_Name = 'Green anole',
  ID = '00002',
  DOI = 'https://doi.org/10.5061/dryad.qbzkh18ks',
  Requires_Authorization = F,
  DNA = T,
  Phenotype = T,
  Map = T,
  Pedigree = F,
  A_Matrix = F,
  GRM = F,
  N_Pheno = nrow(pheno),
  N_Geno = dim(geno@gt)[2] - 1,
  N_markers = dim(geno@gt)[1]
)

library(jsonlite)
meta_json <- toJSON(meta_list, pretty = TRUE, auto_unbox = TRUE)

# Write
write(meta_json, 'meta_data.json')
```


**Citation(s):**

Crawford, D.L., Thompson, M.C., Conn, T., Kaufman, M., Voytko, T., Merritt, A.M., MacKay, H., Billings, T., Chng, Y., Stuart, Y.E. and Oleksiak, M.F., 2023. Convergence or redundancy: alternative views about the evolutionary genomics of character displacement. Evolution, 77(5), pp.1175-1187.
