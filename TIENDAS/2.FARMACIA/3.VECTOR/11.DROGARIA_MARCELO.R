
source("D:/Eduardo Trujillo/Downloads/TESIS/PROGRAMA/importing_cleaning_data.R")

web <- "https://www.drogariamarcelo.com.br/"

nodo <- "div"

elementos <- c(67,71,75,80,84,88)

nombre_cadena <- "Drogar�a_Marcelo"

contacto_Drogar�a_Marcelo <- importing_data(web, nodo, elementos, nombre_cadena)

contacto_Drogar�a_Marcelo<-contacto_Drogar�a_Marcelo %>% mutate(Endere�os_Drogar�a_Marcelo=str_trim(Endere�os_Drogar�a_Marcelo))

contacto_Drogar�a_Marcelo<-contacto_Drogar�a_Marcelo %>% cbind(identificador_f(df = contacto_Drogar�a_Marcelo, variable = "Endere�os_Drogar�a_Marcelo"))

contacto_Drogar�a_Marcelo<-contacto_Drogar�a_Marcelo %>% rename(Endere�os = "Endere�os_Drogar�a_Marcelo")