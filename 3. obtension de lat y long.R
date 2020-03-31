
register_google(key="KEY")

WEBSCRAPING <- read.csv("D:/Eduardo Trujillo/Downloads/TESIS/PROGRAMA/DF.csv", na.strings = "NA") %>% 
  mutate(ENDEREÇOS = str_c("BRASIL", ENDEREÇOS, sep= ",")) %>% 
  mutate(long = (map(ENDEREÇOS,geocode) %>% map_dbl(1)), lat = (map(ENDEREÇOS,geocode) %>% map_dbl(2)))
  
  
write.csv(WEBSCRAPING,"D:/Eduardo Trujillo/Downloads/TESIS/PROGRAMA/DF_COORDENADAS.csv", na  ="", row.names = F)  



