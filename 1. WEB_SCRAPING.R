rm(list=ls())

###LOADING PACKAGES###
library(rvest) #WEBSCRAPING
library(tidyr) #CLEANING DATA
library(dplyr) #MANIPULATING DATA
library(stringr) #CLEANING DATA
library(purrr) #ITERATIONS
library(rebus) #REGULAR EXPRESIONS

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

##############
#html()==read_html()
#html_nodes() exrtraer los nodos relevantes
##############



write.csv(WEBSCRAPING, "D:/Eduardo Trujillo/Downloads/TESIS/PROGRAMA/DF.csv", row.names = F, na = "")


library(data.table)
WEBSCRAPING<-as.data.table(WEBSCRAPING)



universo<-WEBSCRAPING[,.(NOME_UF=str_trim(str_replace_all(NOME_UF,"UF_",""))), by = TIPO_NIELSEN] %>% 
            .[,.N, by = .(NOME_UF,TIPO_NIELSEN)] 
setorder(universo,TIPO_NIELSEN,NOME_UF)








































