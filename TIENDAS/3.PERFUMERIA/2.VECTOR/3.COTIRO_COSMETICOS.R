
source("D:/Eduardo Trujillo/Downloads/TESIS/PROGRAMA/importing_cleaning_data.R")

web <- "http://www.cotiro.com.br/site/#services"

nodo <- "font"

elementos <- c(8,20,32,43,54,66,112,124,136)

nombre_cadena <- "COTIRO_COSMETICOS"

contacto_COTIRO_COSMETICOS <- importing_data(web, nodo, elementos, nombre_cadena)

contacto_COTIRO_COSMETICOS<-contacto_COTIRO_COSMETICOS %>% mutate(Endereços_COTIRO_COSMETICOS=str_trim(Endereços_COTIRO_COSMETICOS))

contacto_COTIRO_COSMETICOS<-contacto_COTIRO_COSMETICOS %>% cbind(identificador_f(df = contacto_COTIRO_COSMETICOS, variable = "Endereços_COTIRO_COSMETICOS"))

contacto_COTIRO_COSMETICOS<-contacto_COTIRO_COSMETICOS %>% rename(Endereços = "Endereços_COTIRO_COSMETICOS")