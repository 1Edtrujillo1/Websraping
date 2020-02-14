
source("D:/Eduardo Trujillo/Downloads/TESIS/PROGRAMA/importing_cleaning_data.R")

web <- "https://www.drogariamarcelo.com.br/"

nodo <- "div"

elementos <- c(67,71,75,80,84,88)

nombre_cadena <- "Drogaría_Marcelo"

contacto_Drogaría_Marcelo <- importing_data(web, nodo, elementos, nombre_cadena)

contacto_Drogaría_Marcelo<-contacto_Drogaría_Marcelo %>% mutate(Endereços_Drogaría_Marcelo=str_trim(Endereços_Drogaría_Marcelo))

contacto_Drogaría_Marcelo<-contacto_Drogaría_Marcelo %>% cbind(identificador_f(df = contacto_Drogaría_Marcelo, variable = "Endereços_Drogaría_Marcelo"))

contacto_Drogaría_Marcelo<-contacto_Drogaría_Marcelo %>% rename(Endereços = "Endereços_Drogaría_Marcelo")