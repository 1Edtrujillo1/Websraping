
source("D:/Eduardo Trujillo/Downloads/TESIS/PROGRAMA/importing_cleaning_data.R")

args.KAWAKAMI<-list(
  
  web = list("http://www.kawakami.com.br/nossas-lojas/loja-bastos","http://www.kawakami.com.br/nossas-lojas/loja-lins","http://www.kawakami.com.br/nossas-lojas/loja-marilia-joao-ramalho","http://www.kawakami.com.br/nossas-lojas/loja-marilia-thomaz-alcalde","http://www.kawakami.com.br/nossas-lojas/loja-paraguacu-paulista","http://www.kawakami.com.br/nossas-lojas/loja-penapolis","http://www.kawakami.com.br/nossas-lojas/loja-tupa-guaranis","http://www.kawakami.com.br/nossas-lojas/loja-tupa-tupinambas"),
  
  nodo = c(c("big","font","p","big"),rep("p",2),rep("big",2)),
  
  elementos = c(rep(list(c(1)),2),c(5),c(1),c(5),c(4),rep(list(c(1)),2)),
  
  nombre_cadena = "KAWAKAMI")

contacto_KAWAKAMI<-pmap_df(args.KAWAKAMI,importing_data)



r_1 <- char_class("-") %R% SPC %R%"Jd. Americano"

#str_view(contacto_KAWAKAMI$Endereços_KAWAKAMI, r_1)

contacto_KAWAKAMI <- contacto_KAWAKAMI %>% mutate(Endereços_KAWAKAMI = cleaning_data_2(x = Endereços_KAWAKAMI, exp1 = r_1))

contacto_KAWAKAMI<-contacto_KAWAKAMI %>% cbind(identificador_f(df = contacto_KAWAKAMI, variable = "Endereços_KAWAKAMI"))

contacto_KAWAKAMI<-contacto_KAWAKAMI %>% rename(Endereços = "Endereços_KAWAKAMI")