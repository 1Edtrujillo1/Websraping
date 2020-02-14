
source("D:/Eduardo Trujillo/Downloads/TESIS/PROGRAMA/importing_cleaning_data.R")

args.DROGARIA_RETIRO<-list(
  
  web = list("http://rederetiro.com.br/page/listaDrogarias.asp",
             "http://rederetiro.com.br/page/listaDrogarias.asp?idPagina=2&q=&busca_cidade=0",
             "http://rederetiro.com.br/page/listaDrogarias.asp?idPagina=3&q=&busca_cidade=0",
             "http://rederetiro.com.br/page/listaDrogarias.asp?idPagina=4&q=&busca_cidade=0",
             "http://rederetiro.com.br/page/listaDrogarias.asp?idPagina=5&q=&busca_cidade=0",
             "http://rederetiro.com.br/page/listaDrogarias.asp?idPagina=6&q=&busca_cidade=0"),
  
  nodo = rep(".tituloListaNoticia",6),
  
  elementos = list(c(1:10),
                   c(1:10),
                   c(1:10),
                   c(1:10),
                   c(1:10),
                   c(1:4)),
  
  nombre_cadena = "DROGARIA_RETIRO")

contacto_DROGARIA_RETIRO<-pmap_df(args.DROGARIA_RETIRO,importing_data)

r_1 <- char_class("(") 
  
r_2 <- "loja"

r <- or(r_1, "loja")

contacto_DROGARIA_RETIRO$Endereços_DROGARIA_RETIRO[c(6,19,34,54)] <- str_split(contacto_DROGARIA_RETIRO$Endereços_DROGARIA_RETIRO[c(6,19,34,54)], r) %>% map_chr(1) %>% str_trim()

contacto_DROGARIA_RETIRO<-contacto_DROGARIA_RETIRO %>% cbind(identificador_f(df = contacto_DROGARIA_RETIRO, variable = "Endereços_DROGARIA_RETIRO"))

contacto_DROGARIA_RETIRO<-contacto_DROGARIA_RETIRO %>% rename(Endereços = "Endereços_DROGARIA_RETIRO")
