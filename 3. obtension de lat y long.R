library(dplyr) ; library(stringr) ; library(purrr) ; library(ggmap) ; library(rebus)


register_google(key="KEY")

WEBSCRAPING <- read.csv("D:/Eduardo Trujillo/Downloads/TESIS/PROGRAMA/DF.csv", na.strings = "NA") %>% 
  mutate(ENDERE?OS = str_c("BRASIL", ENDERE?OS, sep= ",")) %>% 
  mutate(long = (map(ENDERE?OS,geocode) %>% map_dbl(1)), lat = (map(ENDERE?OS,geocode) %>% map_dbl(2)))
  
  
#write.csv(WEBSCRAPING,"D:/Eduardo Trujillo/Downloads/TESIS/PROGRAMA/DF_COORDENADAS.csv", na  ="", row.names = F)  


########

WEBSCRAPING <- read.csv("D:/Eduardo Trujillo/Downloads/TESIS/PROGRAMA/DF_COORDENADAS.csv",na.strings = "NA") %>% mutate_all(as.character)

##############################################################################
#repeated values in ENDERECOS
WEBSCRAPING %>% filter(duplicated(ENDERE?OS))

# Rows to correct

a <- WEBSCRAPING %>% filter(is.na(long))

b <- WEBSCRAPING %>% filter(is.na(lat))

# See whic rows are in a but not in b

a$ENDERE?OS[!a$ENDERE?OS %in% b$ENDERE?OS]

###############################################################################
#Cleaning NA?S rows in lat and long columns

a <- a %>% select(ENDERE?OS,IDENTIFICADOR,TIPO_NIELSEN)


reg_exp_1 <- or(capture("N" %R% char_class("?")), capture("S" %R% char_class("/") %R% "N"), capture(char_class("/") %R% one_or_more(DGT)))

a <- a %>% mutate(ENDERE?OS = str_replace_all(ENDERE?OS,reg_exp_1,""))

reg_exp_2 <- or(capture("AV"%R% char_class(".")), capture("R"%R% char_class(".")), "RUA", "PRA?A","AV","AVENIDA") 

a <- a %>% mutate(ENDERE?OS = str_replace_all(ENDERE?OS,reg_exp_2,""))

cambio <- a %>% filter(str_detect(ENDERE?OS, "CENTRO")) %>% mutate(ENDERE?OS = str_split(ENDERE?OS,or(capture("LJ"%R% SPC %R% "A"),"CENTRO")) %>% map_chr(1))

a[which(str_detect(a$ENDERE?OS, "CENTRO")),] <- cambio


a <- a %>% mutate(long = (map(ENDERE?OS,geocode) %>% map_dbl(1)), lat = (map(ENDERE?OS,geocode) %>% map_dbl(2)))

#write.csv(a,"D:/Eduardo Trujillo/Downloads/TESIS/PROGRAMA/cambios.csv", na  ="", row.names = F)  



geocode("BRASIL,PRESIDENTE GET?LIO VARGAS,2472")


