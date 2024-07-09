library(xml2)

extract_data <- function(df, Tag){
  node <- xml_children(df)[Tag]
  data <- data.frame()
  
  for (i in 2:length(xml_children(node))) {
    child <- xml_children(node)[i]
    row_data <- list()
    for (cell in xml_children(child)) {
      if (xml_name(cell) == "c") {
        cell_value <- xml_text(xml_children(cell)[[1]])
        row_data <- cbind(row_data,cell_value)
      }
    }
    data <- rbind(data,row_data)
  }
  colnames(data) <- LETTERS[1:ncol(data)]
  return(data)
}

# Get geno
geno <- extract_data(read_xml('data/EYTs_GBS_Excel.xlsx/xl/worksheets/sheet1.xml'), Tag = 'TAG')
dim(geno)

# Get pheno1
pheno1 <- extract_data(read_xml('data/EYT2011-12.xlsx/xl/worksheets/sheet1.xml'), Tag = 4)
pheno2 <- extract_data(read_xml('data/EYT2012-13.xlsx/xl/worksheets/sheet1.xml'), Tag = 4)
pheno3 <- extract_data(read_xml('data/EYT2013-14.xlsx/xl/worksheets/sheet1.xml'), Tag = 4)
pheno4 <- extract_data(read_xml('data/EYT2014-15.xlsx/xl/worksheets/sheet1.xml'), Tag = 5)
pheno5 <- extract_data(read_xml('data/EYT2015-16.xlsx/xl/worksheets/sheet1.xml'), Tag = 4)
head(pheno1)
