

vector_farma<-"D:/Eduardo Trujillo/Downloads/TESIS/PROGRAMA/TIENDAS/2.FARMACIA/3.VECTOR/"


source(paste0(vector_farma,"9.DROGA_NEWS.R"))
source(paste0(vector_farma,"10.FARMACIA_ALDESUL.R"))
source(paste0(vector_farma,"11.DROGARIA_MARCELO.R"))

farma_vector<-contacto_News %>% 
  rbind(contacto_farmacia_aldesul,contacto_Drogaría_Marcelo)