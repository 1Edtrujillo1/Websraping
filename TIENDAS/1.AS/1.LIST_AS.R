

list_as<-"D:/Eduardo Trujillo/Downloads/TESIS/PROGRAMA/TIENDAS/1.AS/1.LIST/"
      
source(paste0(list_as,"1.SUPERMERCADOS_BIGMART.R"))
source(paste0(list_as,"2.KAWAKAMI.R"))
source(paste0(list_as,"3.NORI.R"))

# as_list<-contacto_MACHADO_final %>% 
#       cbind.fill(contacto_SUPERMERCADOS_BIGMART_final,contacto_KAWAKAMI_final,
#                  contacto_NORI_final,contacto_SUPER_VAREJÃO_DA_FARTURA_final,
#                  contacto_TOP_SUPERMERCADOS_final,fill=NA)

as_list<-contacto_SUPERMERCADOS_BIGMART %>% 
      rbind(contacto_KAWAKAMI,contacto_NORI)
