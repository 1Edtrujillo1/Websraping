
source("D:/Eduardo Trujillo/Downloads/TESIS/PROGRAMA/importing_cleaning_data.R")

args.NORI<-list(
  
  web = list("http://supermercadosnori.com/nori-aeroporto/","http://supermercadosnori.com/nori-altinopolis/","http://supermercadosnori.com/nori-centro/","http://supermercadosnori.com/nori-vila-lidia/","http://supermercadosnori.com/nori-vila-maria-2/","http://supermercadosnori.com/nori-dos-pupin/"),
  
  nodo = rep("p",6),
  
  elementos = c(rep(3,4),c(4),c(3)),
  
  nombre_cadena = "NORI")
  
contacto_NORI <-pmap_df(args.NORI,importing_data) 

contacto_NORI<-contacto_NORI %>% mutate(Endereços_NORI=str_trim(Endereços_NORI))

contacto_NORI<-contacto_NORI %>% cbind(identificador_f(df = contacto_NORI, variable = "Endereços_NORI"))

contacto_NORI<-contacto_NORI %>% rename(Endereços = "Endereços_NORI")