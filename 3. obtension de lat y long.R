
register_google(key="KEY")

WEBSCRAPING <- read.csv("D:/Eduardo Trujillo/Downloads/TESIS/PROGRAMA/DF.csv", na.strings = "NA") %>% 
  mutate(ENDERE�OS = str_c("BRASIL", ENDERE�OS, sep= ",")) %>% 
  mutate(long = (map(ENDERE�OS,geocode) %>% map_dbl(1)), lat = (map(ENDERE�OS,geocode) %>% map_dbl(2)))
  
  
write.csv(WEBSCRAPING,"D:/Eduardo Trujillo/Downloads/TESIS/PROGRAMA/DF_COORDENADAS.csv", na  ="", row.names = F)  



