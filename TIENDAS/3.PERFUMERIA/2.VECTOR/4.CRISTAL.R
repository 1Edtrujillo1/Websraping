
source("D:/Eduardo Trujillo/Downloads/TESIS/PROGRAMA/importing_cleaning_data.R")

web <- "http://cristalperfumaria.com.br/sitenovo/nossas.php"

nodo <- ".product_name"

elementos <- c(2,4,6,8,10,12,14)

nombre_cadena <- "Cristal"

contacto_Cristal <- importing_data(web, nodo, elementos, nombre_cadena)

r_1 <- or("N.Sr� da Abadia", "MG")

r_2 <- or("Av.", "Pra�a", "Rua.")

contacto_Cristal<-contacto_Cristal%>% mutate(Endere�os_Cristal= cleaning_data_4(Endere�os_Cristal, exp1 = r_1 , exp2 = r_2))

contacto_Cristal<-contacto_Cristal %>% cbind(identificador_f(df = contacto_Cristal, variable = "Endere�os_Cristal"))

contacto_Cristal<-contacto_Cristal %>% rename(Endere�os = "Endere�os_Cristal")