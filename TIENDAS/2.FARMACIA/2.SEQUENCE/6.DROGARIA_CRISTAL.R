
source("D:/Eduardo Trujillo/Downloads/TESIS/PROGRAMA/importing_cleaning_data.R")

web <- "https://www.drogariacristal.com/institucional/834/2930"

nodo <- "p"

elementos <- 2:4

nombre_cadena <- "Drogar�a_Cristal"

contacto_Drogar�a_Cristal <- importing_data(web, nodo, elementos, nombre_cadena)

r_1 <- char_class("(") %R% one_or_more(WRD) %R% char_class(")")

r_2 <- char_class("(") %R% one_or_more(DGT) %R% char_class(")")

contacto_Drogar�a_Cristal<-contacto_Drogar�a_Cristal %>% mutate(Endere�os_Drogar�a_Cristal=cleaning_data_6(Endere�os_Drogar�a_Cristal,exp1 = r_1, exp2 = r_2))

contacto_Drogar�a_Cristal<-contacto_Drogar�a_Cristal %>% cbind(identificador_f(df = contacto_Drogar�a_Cristal, variable = "Endere�os_Drogar�a_Cristal"))

contacto_Drogar�a_Cristal<-contacto_Drogar�a_Cristal %>% rename(Endere�os = "Endere�os_Drogar�a_Cristal")