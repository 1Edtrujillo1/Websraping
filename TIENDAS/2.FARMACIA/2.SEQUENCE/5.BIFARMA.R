
source("D:/Eduardo Trujillo/Downloads/TESIS/PROGRAMA/importing_cleaning_data.R")

web <- "http://www.smguanabara.com.br/nossas-lojas.html"

nodo <- ".endereco"

elementos <- c(1,2,4:7,9)

nombre_cadena <- "Bifarma"

contacto_Bifarma <- importing_data(web, nodo, elementos, nombre_cadena)

r_1 <- repeated(char_class("A-Z"),2,100) %R% SPC %R% repeated(char_class("A-Z"),2,100)
r_2 <- "CEP"

contacto_Bifarma<-contacto_Bifarma %>% mutate(Endereços_Bifarma=cleaning_data_6(Endereços_Bifarma,exp1 = r_1, exp2 = r_2))

contacto_Bifarma<-contacto_Bifarma %>% cbind(identificador_f(df = contacto_Bifarma, variable = "Endereços_Bifarma"))

contacto_Bifarma<-contacto_Bifarma %>% rename(Endereços = "Endereços_Bifarma")