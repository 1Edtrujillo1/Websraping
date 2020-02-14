
source("D:/Eduardo Trujillo/Downloads/TESIS/PROGRAMA/importing_cleaning_data.R")

web <- "http://superandreazza.com.br/nossas-lojas/"

nodo <- "p"

elementos <- c(19,25,33,39,45,51,57,63,68,73,79,84,90,94,100,106,112,118,124,130,135,141,146,151,157,163,169,175)

nombre_cadena <- "SUPER_ANDREAZZA"


contacto_SUPER_ANDREAZZA <- importing_data(web, nodo, elementos, nombre_cadena)

r_1 <- SPC %R% char_class("\r\n ")

#str_view(contacto_SUPER_ANDREAZZA$Endereços_SUPER_ANDREAZZA, r_1)

contacto_SUPER_ANDREAZZA<-contacto_SUPER_ANDREAZZA%>% mutate(Endereços_SUPER_ANDREAZZA=cleaning_data_3(Endereços_SUPER_ANDREAZZA, exp1 = r_1))

contacto_SUPER_ANDREAZZA<-contacto_SUPER_ANDREAZZA %>% cbind(identificador_f(df = contacto_SUPER_ANDREAZZA, variable = "Endereços_SUPER_ANDREAZZA"))

contacto_SUPER_ANDREAZZA<-contacto_SUPER_ANDREAZZA %>% rename(Endereços = "Endereços_SUPER_ANDREAZZA")