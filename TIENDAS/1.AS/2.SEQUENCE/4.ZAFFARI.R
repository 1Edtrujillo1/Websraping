
source("D:/Eduardo Trujillo/Downloads/TESIS/PROGRAMA/importing_cleaning_data.R")

web <- "http://www.grupozaffari.com.br/lojas/"

nodo <- "strong"

elementos <- 1:45

nombre_cadena <- "ZAFFARI"

contacto_ZAFFARI <- importing_data(web, nodo, elementos, nombre_cadena)

contacto_ZAFFARI<-contacto_ZAFFARI %>% mutate(Endereços_ZAFFARI=str_trim(Endereços_ZAFFARI))

contacto_ZAFFARI<-contacto_ZAFFARI %>% cbind(identificador_f(df = contacto_ZAFFARI, variable = "Endereços_ZAFFARI"))

contacto_ZAFFARI<-contacto_ZAFFARI %>% rename(Endereços = "Endereços_ZAFFARI")