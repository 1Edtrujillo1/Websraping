
source("D:/Eduardo Trujillo/Downloads/TESIS/PROGRAMA/importing_cleaning_data.R")

web <- "https://www.ramsons.com.br/institucionais/AntesCompra/NossasLojas.aspx"

nodo <- ".titulo4"

elementos <- c(1,2,12,13,20,21,29,30,35,36,39,40,43,44,45,49)

nombre_cadena <- "RAMSONS"

contacto_RAMSONS <- importing_data(web, nodo, elementos, nombre_cadena)

r_1 <- or(capture(char_class("-") %R% SPC %R% one_or_more(WRD)), "Loja")

contacto_RAMSONS<-contacto_RAMSONS%>% mutate(Endereços_RAMSONS=cleaning_data_3(Endereços_RAMSONS, r_1))

contacto_RAMSONS<-contacto_RAMSONS %>% cbind(identificador_f(df = contacto_RAMSONS, variable = "Endereços_RAMSONS"))

contacto_RAMSONS<-contacto_RAMSONS %>% rename(Endereços = "Endereços_RAMSONS")