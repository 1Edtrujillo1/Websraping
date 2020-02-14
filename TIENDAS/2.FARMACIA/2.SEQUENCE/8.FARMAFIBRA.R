
source("D:/Eduardo Trujillo/Downloads/TESIS/PROGRAMA/importing_cleaning_data.R")

web <- "https://www.farmafibra.com.br/lojas"

nodo <- "p"

elementos <- 1:16

nombre_cadena <- "FARMAFIBRA"

contacto_FARMAFIBRA <- importing_data(web, nodo, elementos, nombre_cadena)

r_1 <- or("Fone", "Fones", char_class("(") %R% one_or_more(DGT) %R% char_class(")"))

r_2 <- or("Rua Vol.","Endereço:","Pça.","Av.","R.") 

contacto_FARMAFIBRA<-contacto_FARMAFIBRA%>% mutate(Endereços_FARMAFIBRA=cleaning_data_4(Endereços_FARMAFIBRA, exp1 = r_1, exp2 = r_2))

contacto_FARMAFIBRA<-contacto_FARMAFIBRA %>% cbind(identificador_f(df = contacto_FARMAFIBRA, variable = "Endereços_FARMAFIBRA"))

contacto_FARMAFIBRA<-contacto_FARMAFIBRA %>% rename(Endereços = "Endereços_FARMAFIBRA")          
 