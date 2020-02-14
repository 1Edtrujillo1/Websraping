
source("D:/Eduardo Trujillo/Downloads/TESIS/PROGRAMA/importing_cleaning_data.R")

web <- "http://grupomercadomoveis.com.br/filiais"

nodo <- ".cell"

elementos <- c(12,15,18,21,24,27,30,33,36,39,42,45)

nombre_cadena <- "MERCADOMOVEIS"

contacto_MERCADOMOVEIS <- importing_data(web, nodo, elementos, nombre_cadena)

r_1 <- capture(char_class("-") %R% SPC %R%one_or_more(WRD))

contacto_MERCADOMOVEIS<-contacto_MERCADOMOVEIS %>% mutate(Endereços_MERCADOMOVEIS=cleaning_data_3(Endereços_MERCADOMOVEIS,exp1 = r_1))

contacto_MERCADOMOVEIS<-contacto_MERCADOMOVEIS %>% cbind(identificador_f(df = contacto_MERCADOMOVEIS, variable = "Endereços_MERCADOMOVEIS"))

contacto_MERCADOMOVEIS<-contacto_MERCADOMOVEIS %>% rename(Endereços = "Endereços_MERCADOMOVEIS")