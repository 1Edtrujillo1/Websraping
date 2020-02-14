
source("D:/Eduardo Trujillo/Downloads/TESIS/PROGRAMA/importing_cleaning_data.R")

web <- "http://www.guiato.com.br/Lojas/Itapetininga/Pao-de-Mel-Supermercados/v-r2373"

nodo <- ".address"

elementos <- 1:5

nombre_cadena <- "PAO_DE_MEL"


contacto_PAO_DE_MEL <- importing_data(web, nodo, elementos, nombre_cadena)


r_1 <- repeated(DGT,lo = 5,hi = 100)
r_2 <- "Itapetininga"

#str_view(contacto_PAO_DE_MEL$Endereços_PAO_DE_MEL,r_1)

contacto_PAO_DE_MEL <- contacto_PAO_DE_MEL %>% mutate(Endereços_PAO_DE_MEL = cleaning_data_4(x = Endereços_PAO_DE_MEL, exp1 = r_1, exp2 = r_2))

contacto_PAO_DE_MEL<-contacto_PAO_DE_MEL %>% cbind(identificador_f(df = contacto_PAO_DE_MEL, variable = "Endereços_PAO_DE_MEL"))

contacto_PAO_DE_MEL<-contacto_PAO_DE_MEL %>% rename(Endereços = "Endereços_PAO_DE_MEL")