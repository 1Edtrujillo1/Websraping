
source("D:/Eduardo Trujillo/Downloads/TESIS/PROGRAMA/importing_cleaning_data.R")

web <- "http://www.smguanabara.com.br/nossas-lojas.html"

nodo <- ".endereco"

elementos <- c(1,2,4:7,9)

nombre_cadena <- "Bifarma"

contacto_Bifarma <- importing_data(web, nodo, elementos, nombre_cadena)

r_1 <- repeated(char_class("A-Z"),2,100) %R% SPC %R% repeated(char_class("A-Z"),2,100)
r_2 <- "CEP"

contacto_Bifarma<-contacto_Bifarma %>% mutate(Enderešos_Bifarma=cleaning_data_6(Enderešos_Bifarma,exp1 = r_1, exp2 = r_2))

contacto_Bifarma<-contacto_Bifarma %>% cbind(identificador_f(df = contacto_Bifarma, variable = "Enderešos_Bifarma"))

contacto_Bifarma<-contacto_Bifarma %>% rename(Enderešos = "Enderešos_Bifarma")