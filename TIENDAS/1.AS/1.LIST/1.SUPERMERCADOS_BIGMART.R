
source("D:/Eduardo Trujillo/Downloads/TESIS/PROGRAMA/importing_cleaning_data.R")

args.SUPERMERCADOS_BIGMART<-list(
  
  web = list("http://www.redebigmart.com.br/category/lojas/","http://www.redebigmart.com.br/category/lojas/page/2/"),
  
  nodo = rep("p",2),
  
  elementos = list(c(1:10),c(1:4,6,7)),
  
  nombre_cadena = "SUPERMERCADOS_BIGMART")

contacto_SUPERMERCADOS_BIGMART<-pmap_df(args.SUPERMERCADOS_BIGMART,importing_data)

#r_1 <- capture(char_class("(") %R% one_or_more(WRD) %R% "a" %R% SPC %R% one_or_more(WRD) %R% char_class(")")%R% SPC %R% char_class("-"))

#r_1 <- capture(char_class("(") %R% one_or_more(WRD) %R% "a" %R% SPC %R% one_or_more(WRD)%R% char_class(")") %R% SPC %R% char_class("-"))

r_1 <- capture(char_class("(") %R% one_or_more(WRD) %R% "a" %R% SPC %R% one_or_more(WRD)%R% char_class(")") %R% SPC %R% char_class("-"))

#r_2 <- "Big Mart" %R% repeated(SPC %R% one_or_more(WRD), 1,100) %R% char_class("-")

#r_2 <- "Big Mart" %R% repeated(SPC %R% one_or_more(WRD), 1,100) %R% char_class("-")

r_2 <- "Big Mart" %R% repeated(SPC %R% one_or_more(WRD), 1,100) %R% char_class("-")

r <- or(r_1,r_2)

r_3 <- char_class("/") %R% "SP"

r_4 <- or("Promissão","Cafelândia","Garça", "Novo Horizonte", "Andradina", "Penápolis")

contacto_SUPERMERCADOS_BIGMART <- contacto_SUPERMERCADOS_BIGMART %>% mutate(Endereços_SUPERMERCADOS_BIGMART = cleaning_data(x = Endereços_SUPERMERCADOS_BIGMART, exp1 = r, exp2 = r_3, exp3 = r_4))

contacto_SUPERMERCADOS_BIGMART<-contacto_SUPERMERCADOS_BIGMART %>% cbind(identificador_f(df = contacto_SUPERMERCADOS_BIGMART, variable = "Endereços_SUPERMERCADOS_BIGMART"))

contacto_SUPERMERCADOS_BIGMART<-contacto_SUPERMERCADOS_BIGMART %>% rename(Endereços = "Endereços_SUPERMERCADOS_BIGMART")

#str_view(contacto_SUPERMERCADOS_BIGMART$Endereços_SUPERMERCADOS_BIGMART,r_1)
# 
# contacto_SUPERMERCADOS_BIGMART$Endereços_SUPERMERCADOS_BIGMART <- str_trim(str_split(contacto_SUPERMERCADOS_BIGMART$Endereços_SUPERMERCADOS_BIGMART,r) %>% map_chr(2))
# 
# r_3 <- char_class("/")%R% "SP"
# 
# #str_view(contacto_SUPERMERCADOS_BIGMART$Endereços_SUPERMERCADOS_BIGMART,r_3)
# 
# contacto_SUPERMERCADOS_BIGMART$Endereços_SUPERMERCADOS_BIGMART <- str_trim(str_split(contacto_SUPERMERCADOS_BIGMART$Endereços_SUPERMERCADOS_BIGMART,r_3) %>% map_chr(1))
# 
# r_4 <- or("Promissão","Cafelândia","Garça", "Novo Horizonte", "Andradina", "Penápolis")
# 
# #str_view(contacto_SUPERMERCADOS_BIGMART$Endereços_SUPERMERCADOS_BIGMART,r_4)
# 
# contacto_SUPERMERCADOS_BIGMART$Endereços_SUPERMERCADOS_BIGMART <- str_trim(str_replace_all(contacto_SUPERMERCADOS_BIGMART$Endereços_SUPERMERCADOS_BIGMART, pattern = r_4, replacement = ""))
# 


