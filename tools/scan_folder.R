# An R-script to generate the list of data sets by scanning all the folders
path='~/Dropbox/GPDatasets/GPDatasets/Datasets'
library(jsonlite)                   
data_list=list.files(path,full.names=TRUE)

datasets=as.data.frame(read_json(paste0(data_list[1],'/','meta_data.json')))

if(length(data_list)>1){
	for(i in 2:length(data_list)){
		tmp=as.data.frame(read_json(paste0(data_list[i],'/','meta_data.json')))
		datasets=rbind(datasets,tmp)
	}
}
setwd('../')
write.csv(datasets,file='data_sets.csv')

                               
