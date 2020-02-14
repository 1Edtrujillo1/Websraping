
source("D:/Eduardo Trujillo/Downloads/TESIS/PROGRAMA/importing_cleaning_data.R")

args.Drogaven<-list(
  
  web = list("http://drogaven.com.br/araraquarasp/", 
             "http://drogaven.com.br/americo-brasiliensesp/", 
             "http://drogaven.com.br/mataosp/", 
             "http://drogaven.com.br/taquaritingasp/"),
  
  nodo = rep("p",4),
  
  elementos = list(c(1:24),c(1:3),c(1:3),c(1)),
  
  nombre_cadena = "Drogaven")

contacto_Drogaven<-pmap_df(args.Drogaven,importing_data)


r_1 <- capture(char_class("-") %R% SPC %R% one_or_more(WRD))

contacto_Drogaven<-contacto_Drogaven %>% mutate(Endereços_Drogaven=cleaning_data_3(contacto_Drogaven$Endereços_Drogaven,r_1))

contacto_Drogaven<-contacto_Drogaven %>% cbind(identificador_f(df = contacto_Drogaven, variable = "Endereços_Drogaven"))

contacto_Drogaven<-contacto_Drogaven %>% rename(Endereços = "Endereços_Drogaven")
