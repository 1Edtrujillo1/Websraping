rm(list=ls())

###LOADING PACKAGES###

library(purrr)

map(c("rvest", "tidyr", "dplyr", "stringr", "purrr", "rebus"), 
    require, character.only = TRUE) 

webscraping<-"D:/Eduardo Trujillo/Downloads/TESIS/PROGRAMA/TIENDAS/"

source(paste0(webscraping,"1.AS.R"))
source(paste0(webscraping,"2.FARMACIA.R"))
source(paste0(webscraping,"3.PERFUMERIA.R"))
source(paste0(webscraping,"4.ELECTRONICA.R"))

WEBSCRAPING<-AS %>% rbind(FARMA,PERF,CELULAR)

names(WEBSCRAPING)<-toupper(names(WEBSCRAPING))

for(i in 1:length(WEBSCRAPING)){
  WEBSCRAPING[,i]<-toupper(WEBSCRAPING[,i])
}

write.csv(WEBSCRAPING, "D:/Eduardo Trujillo/Downloads/TESIS/PROGRAMA/DF.csv", row.names = F, na = "")

##############
#html()==read_html()
#html_nodes() exrtraer los nodos relevantes
##############











































