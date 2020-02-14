

vector_celular<-"D:/Eduardo Trujillo/Downloads/TESIS/PROGRAMA/TIENDAS/4.ELECTRONICA/2.VECTOR/"

source(paste0(vector_celular,"2.MERCADOMOVEIS.R"))
source(paste0(vector_celular,"3.RAMSONS.R"))
source(paste0(vector_celular,"4. LOJAS_BENOIT.R"))

celular_vector<-contacto_MERCADOMOVEIS %>% 
  rbind(contacto_RAMSONS,contacto_LOJAS_BENOIT)
