
source("D:/Eduardo Trujillo/Downloads/TESIS/PROGRAMA/importing_cleaning_data.R")

web <- "http://www.farmaciaalquimia.com.br/conteudo/lojas/default.aspx"

nodo <- ".item"

elementos <- c(1:3,5,6,11)


nombre_cadena <- "Farmacia_alquimia"

contacto_Farmacia_alquimia <- importing_data(web, nodo, elementos, nombre_cadena)

r_1 <- repeated(char_class("A-Z"),2,100)
r_2 <- repeated(char_class("A-Z"),2,100) %R% SPC %R% repeated(char_class("A-Z"),2,100)
 
r <- or(r_2,r_1)

r_3 <- or("Centro", "cai" %R% char_class("@"), "Campo", "Ed"%R% char_class("."), "Parque", "Loja")


contacto_Farmacia_alquimia<-contacto_Farmacia_alquimia %>% mutate(Endereços_Farmacia_alquimia=cleaning_data_6(Endereços_Farmacia_alquimia,exp1 = r, exp2 = r_3))

contacto_Farmacia_alquimia<-contacto_Farmacia_alquimia %>% cbind(identificador_f(df = contacto_Farmacia_alquimia, variable = "Endereços_Farmacia_alquimia"))

contacto_Farmacia_alquimia<-contacto_Farmacia_alquimia %>% rename(Endereços = "Endereços_Farmacia_alquimia")