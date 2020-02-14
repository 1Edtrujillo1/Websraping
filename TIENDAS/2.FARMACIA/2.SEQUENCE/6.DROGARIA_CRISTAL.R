
source("D:/Eduardo Trujillo/Downloads/TESIS/PROGRAMA/importing_cleaning_data.R")

web <- "https://www.drogariacristal.com/institucional/834/2930"

nodo <- "p"

elementos <- 2:4

nombre_cadena <- "Drogaría_Cristal"

contacto_Drogaría_Cristal <- importing_data(web, nodo, elementos, nombre_cadena)

r_1 <- char_class("(") %R% one_or_more(WRD) %R% char_class(")")

r_2 <- char_class("(") %R% one_or_more(DGT) %R% char_class(")")

contacto_Drogaría_Cristal<-contacto_Drogaría_Cristal %>% mutate(Endereços_Drogaría_Cristal=cleaning_data_6(Endereços_Drogaría_Cristal,exp1 = r_1, exp2 = r_2))

contacto_Drogaría_Cristal<-contacto_Drogaría_Cristal %>% cbind(identificador_f(df = contacto_Drogaría_Cristal, variable = "Endereços_Drogaría_Cristal"))

contacto_Drogaría_Cristal<-contacto_Drogaría_Cristal %>% rename(Endereços = "Endereços_Drogaría_Cristal")