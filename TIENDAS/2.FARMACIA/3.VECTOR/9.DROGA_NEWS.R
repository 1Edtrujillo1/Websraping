
source("D:/Eduardo Trujillo/Downloads/TESIS/PROGRAMA/importing_cleaning_data.R")

web <- "http://www.droganews.com.br/lojas.html"

nodo <- "p"

elementos <- c(9,11,19,25,27,33,35,41,43,49,51,57,59,65,67,73,75,81,83,89,91,104,108,112,116,120,124,128,132,136,140,144,148,152,156,160,164,168,172,176,180)

nombre_cadena <- "News"

contacto_News <- importing_data(web, nodo, elementos, nombre_cadena)

contacto_News<-contacto_News %>% mutate(Endereços_News=str_trim(Endereços_News))

contacto_News<-contacto_News %>% cbind(identificador_f(df = contacto_News, variable = "Endereços_News"))

contacto_News<-contacto_News %>% rename(Endereços = "Endereços_News")