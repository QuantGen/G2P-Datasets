**Dataset:** ID_Species

**DOI:**

**Download instrucctions:**

**R script to format data:**

**Create meta_data.json:**

List format:
```R
meta_list <- list (
Dataset_Folder = ...,
Scientific_Name = ...,
Common_Name = ...,
ID = ...,
DOI = ...,
Requires_Authorization = ...,
DNA = ...,
Phenotype = ...,
Map = ...,
Pedigree = ...,
A_Matrix = ...,
GRM = ...,
N_Pheno = ...,
N_Geno = ...
)

library(jsonlite)
meta_json <- toJSON(meta_list, pretty = TRUE, auto_unbox = TRUE)

# Write
write(meta_json, "meta_data.json")

# Read
meta_json <- read_json("meta_data.json")
```


**Citation(s):**
