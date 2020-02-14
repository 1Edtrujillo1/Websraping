
source("D:/Eduardo Trujillo/Downloads/TESIS/PROGRAMA/importing_cleaning_data.R")

args.Farma_Bem<-list(
  
  web = list("http://farmabem.com.br/?page_id=144&cidade=manaus&bairro=all",
             "http://farmabem.com.br/?page_id=144&cidade=porto-velho&bairro=all"),
  
  nodo = rep("span",2),
  
  elementos = list(c(4,5,7,9,11,14,16,18,20,22,23,25,27,28,29,31,33,35,37,39,41,43,45,47,49,51,52,54,56,58,59,60,62,64,66,67,69,71,73,75,77,79,80,81,82,84,86,88,89,91,93,95,97),
                   c(4,6,7,9,11,13,14,16,18)),
  
  nombre_cadena = "Farma_Bem")

contacto_Farma_Bem<-pmap_df(args.Farma_Bem,importing_data)

r_1 <- "Endereço:"

r_2 <- or(capture(char_class("-") %R% SPC %R% one_or_more(WRD) %R% SPC),char_class("-") %R% SPC %R% WRD,
          char_class("-") %R% SPC %R% ANY_CHAR,"Loja")

contacto_Farma_Bem<-contacto_Farma_Bem %>% mutate(Endereços_Farma_Bem=cleaning_data_6(Endereços_Farma_Bem,exp1 = r_1,exp2 = r_2))

contacto_Farma_Bem<-contacto_Farma_Bem %>% cbind(identificador_f(df = contacto_Farma_Bem, variable = "Endereços_Farma_Bem"))

contacto_Farma_Bem<-contacto_Farma_Bem %>% rename(Endereços = "Endereços_Farma_Bem")
