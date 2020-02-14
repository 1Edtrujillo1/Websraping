
source("D:/Eduardo Trujillo/Downloads/TESIS/PROGRAMA/importing_cleaning_data.R")

web <- "http://decisaoatacarejo.com/lojas/"

nodo <- "p"

elementos <- c(1,3,5,7,9)

nombre_cadena <- "BAKLIZI"


contacto_BAKLIZI <- importing_data(web, nodo, elementos, nombre_cadena)

r_1 <- repeated(DGT, lo = 4, hi = 100) %R% char_class("-") %R% DGT
r_2 <- repeated(DGT, lo = 4, hi = 100) %R% SPC %R% DGT
r <- or(r_1,r_2)

r_3 <- repeated(DGT, lo = 3, hi = 100) %R% SPC %R% or("Avenida","Av.","Rua")

r_4 <- char_class("/") %R% "MG"

r_5 <- or("Centro", "Lagoa Santa", "Brazilian Shopping", "Santa Luzia", "Venda")

contacto_BAKLIZI<-contacto_BAKLIZI %>% mutate(Endereços_BAKLIZI=cleaning_data_5(x = Endereços_BAKLIZI,exp1 = r, exp2 = r_3, exp3 = r_4, exp4 = r_5))

contacto_BAKLIZI<-contacto_BAKLIZI %>% cbind(identificador_f(df = contacto_BAKLIZI, variable = "Endereços_BAKLIZI"))

contacto_BAKLIZI<-contacto_BAKLIZI %>% rename(Endereços = "Endereços_BAKLIZI")

