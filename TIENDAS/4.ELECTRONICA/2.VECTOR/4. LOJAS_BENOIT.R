
source("D:/Eduardo Trujillo/Downloads/TESIS/PROGRAMA/importing_cleaning_data.R")

web <- "https://www.tiendeo.com.br/Lojas/benoit-r"

nodo <- ".typo-body-13-reg"

elementos <- c(1:11,14:18)

nombre_cadena <- "LOJAS_BENOIT"

contacto_LOJAS_BENOIT <- importing_data(web, nodo, elementos, nombre_cadena)

r_1 <- or("Pr�ximo", "Na", "Sala", capture(char_class(",") %R% SPC %R% SPC %R% char_class("A-Z")))

contacto_LOJAS_BENOIT<-contacto_LOJAS_BENOIT %>% mutate(Endere�os_LOJAS_BENOIT=cleaning_data_3(Endere�os_LOJAS_BENOIT, exp1 = r_1))

contacto_LOJAS_BENOIT<-contacto_LOJAS_BENOIT %>% cbind(identificador_f(df = contacto_LOJAS_BENOIT, variable = "Endere�os_LOJAS_BENOIT"))

contacto_LOJAS_BENOIT<-contacto_LOJAS_BENOIT %>% rename(Endere�os = "Endere�os_LOJAS_BENOIT")


