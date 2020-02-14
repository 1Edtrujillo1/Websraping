celular<-"D:/Eduardo Trujillo/Downloads/TESIS/PROGRAMA/TIENDAS/4.ELECTRONICA/"

source(paste0(celular,"1.SEQUENCE_CELULAR.R"))
source(paste0(celular,"2.VECTOR_CELULAR.R"))

CELULAR<-celular_sequence %>% rbind(celular_vector)

TIPO_NIELSEN<-"CELULAR"

CELULAR <-CELULAR %>% cbind(TIPO_NIELSEN)