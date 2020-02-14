farma<-"D:/Eduardo Trujillo/Downloads/TESIS/PROGRAMA/TIENDAS/2.FARMACIA/"

source(paste0(farma,"1.LIST_FARMA.R"))
source(paste0(farma,"2.SEQUENCE_FARMA.R"))
source(paste0(farma,"3.VECTOR_FARMA.R"))

FARMA<-farma_list %>% rbind(farma_sequence,farma_vector)

TIPO_NIELSEN<-"FARMA"

FARMA <-FARMA %>% cbind(TIPO_NIELSEN)