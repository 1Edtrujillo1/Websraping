perf<-"D:/Eduardo Trujillo/Downloads/TESIS/PROGRAMA/TIENDAS/3.PERFUMERIA/"

source(paste0(perf,"1.SEQUENCE_PERF.R"))
source(paste0(perf,"2.VECTOR_PERF.R"))

PERF<-perf_sequence %>% rbind(perf_vector)

TIPO_NIELSEN<-"PERF"

PERF <-PERF %>% cbind(TIPO_NIELSEN)