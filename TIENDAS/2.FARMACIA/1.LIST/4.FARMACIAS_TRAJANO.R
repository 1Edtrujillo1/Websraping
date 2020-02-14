
source("D:/Eduardo Trujillo/Downloads/TESIS/PROGRAMA/importing_cleaning_data.R")

args.FARMACIAS_TRAJANO<-list(
  
  web = list("http://www.farmaciastrajano.com.br/unidades/trajano-shopping-cidade-dos-lagos/",
             "http://www.farmaciastrajano.com.br/unidades/trajano-matriz-24-horas/",
             "http://www.farmaciastrajano.com.br/unidades/trajano-bonsucesso/",
             "http://www.farmaciastrajano.com.br/unidades/trajano-colonia/",
             "http://www.farmaciastrajano.com.br/unidades/trajano-espaco-saude/",
             "http://www.farmaciastrajano.com.br/unidades/trajano-hiper/",
             "http://www.farmaciastrajano.com.br/unidades/trajano-padre-chagas/",
             "http://www.farmaciastrajano.com.br/unidades/trajano-ponto-extra/",
             "http://www.farmaciastrajano.com.br/unidades/trajano-santa-cruz/",
             "http://www.farmaciastrajano.com.br/unidades/trajano-santa-paula/",
             "http://www.farmaciastrajano.com.br/unidades/trajano-terminal/",
             "http://www.farmaciastrajano.com.br/unidades/trajano-avenida/",
             "http://www.farmaciastrajano.com.br/unidades/trajano-sao-cristovao/",
             "http://www.farmaciastrajano.com.br/unidades/trajano-pahy/",
             "http://www.farmaciastrajano.com.br/unidades/trajano-irati/",
             "http://www.farmaciastrajano.com.br/unidades/trajano-sao-mateus-central/",
             "http://www.farmaciastrajano.com.br/unidades/trajano-sao-mateus/",
             "http://www.farmaciastrajano.com.br/unidades/trajano-campo-mourao/",
             "http://www.farmaciastrajano.com.br/unidades/trajano-porto-uniao/"),
  
  nodo = c(rep("p",15),c("span"),rep("p",3)),
  
  elementos = c(c(12),rep(list(c(2)),14),c(5),rep(list(c(2)),3)),
  
  nombre_cadena = "FARMACIAS_TRAJANO")

contacto_FARMACIAS_TRAJANO<-pmap_df(args.FARMACIAS_TRAJANO,importing_data)

r_1 <- "Endereço:"

r_2 <- capture(char_class("/") %R% SPC %R% "PR")

r_3 <- or(r_2, "PR", "fone")

contacto_FARMACIAS_TRAJANO<-contacto_FARMACIAS_TRAJANO %>% mutate(Endereços_FARMACIAS_TRAJANO=cleaning_data_6(Endereços_FARMACIAS_TRAJANO,exp1 = r_1, exp2 = r_3))

contacto_FARMACIAS_TRAJANO<-contacto_FARMACIAS_TRAJANO %>% cbind(identificador_f(df = contacto_FARMACIAS_TRAJANO, variable = "Endereços_FARMACIAS_TRAJANO"))

contacto_FARMACIAS_TRAJANO<-contacto_FARMACIAS_TRAJANO %>% rename(Endereços = "Endereços_FARMACIAS_TRAJANO")