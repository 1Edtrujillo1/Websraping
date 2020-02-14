

sequence_farma<-"D:/Eduardo Trujillo/Downloads/TESIS/PROGRAMA/TIENDAS/2.FARMACIA/2.SEQUENCE/"

source(paste0(sequence_farma,"5.BIFARMA.R"))
source(paste0(sequence_farma,"6.DROGARIA_CRISTAL.R"))
source(paste0(sequence_farma,"7.FARMACIA_ALQUIMIA.R"))
source(paste0(sequence_farma,"8.FARMAFIBRA.R"))

farma_sequence<-contacto_Bifarma %>% 
  rbind(contacto_Drogaría_Cristal,contacto_Farmacia_alquimia,
        contacto_FARMAFIBRA)