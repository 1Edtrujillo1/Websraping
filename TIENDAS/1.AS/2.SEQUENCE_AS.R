

sequence_as<-"D:/Eduardo Trujillo/Downloads/TESIS/PROGRAMA/TIENDAS/1.AS/2.SEQUENCE/"

source(paste0(sequence_as,"4.ZAFFARI.R"))
source(paste0(sequence_as,"5.TOME_LEVE.R"))
source(paste0(sequence_as,"6.PAO_DE_MEL.R"))

as_sequence<-contacto_ZAFFARI %>%
  rbind(contacto_TOME_LEVE,
        contacto_PAO_DE_MEL)                                        

  
