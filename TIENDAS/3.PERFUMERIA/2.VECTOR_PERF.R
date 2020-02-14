

vector_perf<-"D:/Eduardo Trujillo/Downloads/TESIS/PROGRAMA/TIENDAS/3.PERFUMERIA/2.VECTOR/"

source(paste0(vector_perf,"3.COTIRO_COSMETICOS.R"))
source(paste0(vector_perf,"4.CRISTAL.R"))

perf_vector<-contacto_COTIRO_COSMETICOS %>% 
  rbind(contacto_Cristal)