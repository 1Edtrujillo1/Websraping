
source("D:/Eduardo Trujillo/Downloads/TESIS/PROGRAMA/importing_cleaning_data.R")

web <- "http://aldesul.com.br/lojas"

nodo <- "p"

elementos <- c(2,7,12,17,22,27,32,37,42,47,51,56,66,71,76,81,86,91,100,102,104,106,108,110,112,114,116,118)

nombre_cadena <- "farmacia_aldesul"

contacto_farmacia_aldesul <- importing_data(web, nodo, elementos, nombre_cadena)

r_1 <- "Endereço:"

contacto_farmacia_aldesul<-contacto_farmacia_aldesul %>% mutate(Endereços_farmacia_aldesul=cleaning_data_2(Endereços_farmacia_aldesul, exp1 = r_1))

contacto_farmacia_aldesul<-contacto_farmacia_aldesul %>% cbind(identificador_f(df = contacto_farmacia_aldesul, variable = "Endereços_farmacia_aldesul"))

contacto_farmacia_aldesul<-contacto_farmacia_aldesul %>% rename(Endereços = "Endereços_farmacia_aldesul")







