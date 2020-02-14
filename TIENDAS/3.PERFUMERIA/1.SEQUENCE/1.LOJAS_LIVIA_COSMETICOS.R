
source("D:/Eduardo Trujillo/Downloads/TESIS/PROGRAMA/importing_cleaning_data.R")

web <- "https://www.lojaslivia.com.br/Institucional/NossasLojas"

nodo <- "p"

elementos <- 1:11

nombre_cadena <- "LOJAS_LIVIA_COSMETICOS"

contacto_LOJAS_LIVIA_COSMETICOS <- importing_data(web, nodo, elementos, nombre_cadena)

r_1 <- "Cep"

contacto_LOJAS_LIVIA_COSMETICOS<-contacto_LOJAS_LIVIA_COSMETICOS %>% mutate(Endere�os_LOJAS_LIVIA_COSMETICOS=cleaning_data_3(Endere�os_LOJAS_LIVIA_COSMETICOS,exp1 = r_1))

contacto_LOJAS_LIVIA_COSMETICOS<-contacto_LOJAS_LIVIA_COSMETICOS %>% cbind(identificador_f(df = contacto_LOJAS_LIVIA_COSMETICOS, variable = "Endere�os_LOJAS_LIVIA_COSMETICOS"))

contacto_LOJAS_LIVIA_COSMETICOS<-contacto_LOJAS_LIVIA_COSMETICOS %>% rename(Endere�os = "Endere�os_LOJAS_LIVIA_COSMETICOS")