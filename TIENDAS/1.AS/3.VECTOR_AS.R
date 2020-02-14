

vector_as<-"D:/Eduardo Trujillo/Downloads/TESIS/PROGRAMA/TIENDAS/1.AS/3.VECTOR/"

source(paste0(vector_as,"7.SUPER_ANDREAZZA.R"))
source(paste0(vector_as,"8.BAKLIZI.R"))

as_vector<-contacto_SUPER_ANDREAZZA %>% 
  rbind(contacto_BAKLIZI)
                                                    
