
source("D:/Eduardo Trujillo/Downloads/TESIS/PROGRAMA/importing_cleaning_data.R")

web <- "https://www.sipolatti.com.br/institucional/nossas-lojas"

nodo <- "p"

elementos <- 4:38

nombre_cadena <- "SIPOLATTI"

contacto_SIPOLATTI <- importing_data(web, nodo, elementos, nombre_cadena)

r_1 <- or(capture(SPC %R% char_class("-") %R% SPC), "loja", capture("Estado" %R% char_class(":")))

r_2 <- "Enderešo" %R% char_class(":")

contacto_SIPOLATTI<-contacto_SIPOLATTI %>% mutate(Enderešos_SIPOLATTI=cleaning_data_4(Enderešos_SIPOLATTI, exp1 = r_1, exp2 = r_2))

contacto_SIPOLATTI<-contacto_SIPOLATTI %>% cbind(identificador_f(df = contacto_SIPOLATTI, variable = "Enderešos_SIPOLATTI"))

contacto_SIPOLATTI<-contacto_SIPOLATTI %>% rename(Enderešos = "Enderešos_SIPOLATTI")