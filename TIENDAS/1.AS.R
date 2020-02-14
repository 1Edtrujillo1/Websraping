as<-"D:/Eduardo Trujillo/Downloads/TESIS/PROGRAMA/TIENDAS/1.AS/"

source(paste0(as,"1.LIST_AS.R"))
source(paste0(as,"2.SEQUENCE_AS.R"))
source(paste0(as,"3.VECTOR_AS.R"))

AS<-as_list %>% rbind(as_sequence,as_vector)

TIPO_NIELSEN<-"AS"

AS <-AS %>% cbind(TIPO_NIELSEN)
