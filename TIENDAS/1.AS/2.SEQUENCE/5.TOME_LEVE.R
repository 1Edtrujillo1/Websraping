
source("D:/Eduardo Trujillo/Downloads/TESIS/PROGRAMA/importing_cleaning_data.R")

web <- "http://site.tomeleve.com.br/lojas"

nodo <- ".item-endereco"

elementos <- 1:8

nombre_cadena <- "TOME_LEVE"


contacto_TOME_LEVE <- importing_data(web, nodo, elementos, nombre_cadena)


r_1 <- char_class("\n")


#str_view(contacto_TOME_LEVE$Endereços_TOME_LEVE, r_1)

contacto_TOME_LEVE <- contacto_TOME_LEVE %>% mutate(Endereços_TOME_LEVE = cleaning_data_3(x = Endereços_TOME_LEVE, exp1 = r_1))

contacto_TOME_LEVE<-contacto_TOME_LEVE %>% cbind(identificador_f(df = contacto_TOME_LEVE, variable = "Endereços_TOME_LEVE"))

contacto_TOME_LEVE<-contacto_TOME_LEVE %>% rename(Endereços = "Endereços_TOME_LEVE")
