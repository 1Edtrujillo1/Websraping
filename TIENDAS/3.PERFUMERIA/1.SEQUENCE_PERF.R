

sequence_perf<-"D:/Eduardo Trujillo/Downloads/TESIS/PROGRAMA/TIENDAS/3.PERFUMERIA/1.SEQUENCE/"

source(paste0(sequence_perf,"1.LOJAS_LIVIA_COSMETICOS.R"))
source(paste0(sequence_perf,"2.NOVA_ERA_COSMETICOS.R"))

perf_sequence<-contacto_LOJAS_LIVIA_COSMETICOS %>% 
  rbind(contacto_NOVA_ERA_COSMETICOS)