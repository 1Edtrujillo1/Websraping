
source("D:/Eduardo Trujillo/Downloads/TESIS/PROGRAMA/importing_cleaning_data.R")

web <- "https://novaerabeleza.com.br/lojas/"

nodo <- "a"

elementos <- 11:17

nombre_cadena <- "NOVA_ERA_COSMETICOS"

contacto_NOVA_ERA_COSMETICOS <- importing_data(web, nodo, elementos, nombre_cadena)

contacto_NOVA_ERA_COSMETICOS <-contacto_NOVA_ERA_COSMETICOS %>% mutate(Endere�os_NOVA_ERA_COSMETICOS=str_trim(Endere�os_NOVA_ERA_COSMETICOS))

contacto_NOVA_ERA_COSMETICOS<-contacto_NOVA_ERA_COSMETICOS %>% cbind(identificador_f(df = contacto_NOVA_ERA_COSMETICOS, variable = "Endere�os_NOVA_ERA_COSMETICOS"))

contacto_NOVA_ERA_COSMETICOS<-contacto_NOVA_ERA_COSMETICOS %>% rename(Endere�os = "Endere�os_NOVA_ERA_COSMETICOS")