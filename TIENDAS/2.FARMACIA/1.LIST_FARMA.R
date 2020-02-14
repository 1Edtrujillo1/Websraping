

list_farma<-"D:/Eduardo Trujillo/Downloads/TESIS/PROGRAMA/TIENDAS/2.FARMACIA/1.LIST/"

source(paste0(list_farma,"1.DROGARIA_RETIRO.R"))
source(paste0(list_farma,"2.DROGAVEN.R"))
source(paste0(list_farma,"3.FARMA_BEM.R"))
source(paste0(list_farma,"4.FARMACIAS_TRAJANO.R"))


farma_list<-contacto_DROGARIA_RETIRO %>% 
  rbind(contacto_Drogaven,contacto_Farma_Bem,contacto_FARMACIAS_TRAJANO)