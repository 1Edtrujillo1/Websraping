
importing_data <- function(web, nodo, elementos, nombre_cadena) {
  
  CADENA <- read_html(web)
  elements_CADENA <- CADENA %>% html_nodes(nodo) %>% html_text() %>%
    str_trim()
  contacto_CADENA <- elements_CADENA[elementos] %>% 
    map_df(function(x) return(list(cambio = x))) 
  names(contacto_CADENA)<-str_c("Endereços",nombre_cadena, sep = "_")
  contacto_CADENA
}


cleaning_data <- function(x, exp1, exp2, exp3) {
  x %>% 
    str_split(exp1) %>% map_chr(2) %>% 
    str_split(exp2) %>% map_chr(1) %>% 
    str_replace_all(pattern = exp3, replacement = "") %>% 
    str_trim()
}

cleaning_data_2 <- function(x, exp1) {
  x %>% str_replace(exp1, "") %>% str_trim()
}

cleaning_data_3 <- function(x, exp1) {
  x %>% str_split(exp1) %>% map_chr(1) %>%
    str_trim()
}


cleaning_data_4 <- function(x, exp1, exp2) {
  x %>% 
    str_split(exp1) %>% map_chr(1) %>% 
    str_replace_all(pattern = exp2, replacement = "") %>% 
    str_trim()
}


cleaning_data_5 <- function(x, exp1, exp2, exp3, exp4) {
  x %>% 
    str_split(exp1) %>% map_chr(2) %>% 
    str_split(exp2) %>% map_chr(2) %>% 
    str_replace_all(pattern = exp3, replacement = "") %>% 
    str_split(exp4) %>% map_chr(1) %>% 
    str_trim()
}


cleaning_data_6 <- function(x, exp1, exp2) {
  x %>% 
    str_split(exp1) %>% map_chr(2) %>% 
    str_split(exp2) %>% map_chr(1) %>% 
    str_trim()
}

identificador_f <- function(df, variable) {
  cambio <- df %>% gather(variable, key = "identificador", value = "quitar") %>% 
    select(-quitar) 
  cambio$identificador <- cambio$identificador %>% 
    map_chr(function(x){str_trim(str_replace_all(x,capture("Endereços" %R% char_class("_")), ""))})
  cambio
}
