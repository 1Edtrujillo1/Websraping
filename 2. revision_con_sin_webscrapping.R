WEBSCRAPING <- read.csv("D:/Eduardo Trujillo/Downloads/TESIS/PROGRAMA/DF.csv", na.strings = "NA")

SIN_WEBSCRAPING <- read.csv("D:/Eduardo Trujillo/Downloads/TESIS/PROGRAMA/sin_webscrapping.csv", na.strings = "NA")

REVISAR <- WEBSCRAPING %>% group_by(IDENTIFICADOR) %>% summarise(conteo_con_webscrapping  = n()) %>% 
  inner_join(SIN_WEBSCRAPING, by = "IDENTIFICADOR")

library(ggplot2)

grafica <- REVISAR %>% ggplot(aes(y = IDENTIFICADOR)) + 
  geom_point(aes(x = conteo_sin_webscrapping, col = "red"), position = "jitter", size = 1) + 
  geom_point(aes(x = conteo_con_webscrapping, col = "blue"), position = "jitter", size = 2, alpha = 0.3) + 
  labs(x="CONTEO",
       y="CADENA", 
       caption= "COMPARATIVO") + 
  scale_color_manual(name = "Conteo",
                     values = c("red","blue"),
                     labels = c("si web","no web"))

grafica




