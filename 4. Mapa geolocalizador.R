rm(list = ls())

library(dplyr) ; library(htmlwidgets) ; library(leaflet) ; library(leaflet.extras)


WEBSCRAPING <- read.csv("D:/Eduardo Trujillo/Downloads/TESIS/PROGRAMA/DF_COORDENADAS.csv",na.strings = "NA")

#WEBSCRAPING %>% group_by(TIPO_NIELSEN)%>% summarize(n())

# Mapa acorde al tipo de cadena


factor_color<-colorFactor(palette=c("#2cb42c","blue","#9b4a11","red"),
                          levels=c("AS","CELULAR","FARMA","PERF"))

#minzoom: tope de zoom hacia atras(vista hacia el mundo)
#dragging = TRUE para poder mover el mapa con el mouse

map_web <- leaflet(options = leafletOptions(dragging = TRUE, minZoom = 4)) %>% 
  addTiles(group="OSM") %>% 
  addProviderTiles("CartoDB", group="Carto") %>% 
  addProviderTiles("Esri", group = "Esri") %>%  
  setView(lng = -51.9,
          lat = -14.2,
          zoom = 4) %>% 
  setMaxBounds(lng1 = -77.05078169703484, lat1 = 17.644022027872726,
               lng2 = -12.348629459738731 , lat2 = -37.37015878278322) %>% 
  addCircleMarkers(data = WEBSCRAPING %>% filter(TIPO_NIELSEN == 'AS'), lng = ~long,lat= ~lat,label= ~ENDEREÇOS,color= ~factor_color(TIPO_NIELSEN), group = "AS",radius = 4,opacity = 0.4) %>% 
  addCircleMarkers(data = WEBSCRAPING %>% filter(TIPO_NIELSEN == 'CELULAR'), lng = ~long,lat= ~lat,label= ~ENDEREÇOS,color= ~factor_color(TIPO_NIELSEN), group = "CELULAR",radius = 4, opacity = 0.5) %>%
  addCircleMarkers(data = WEBSCRAPING %>% filter(TIPO_NIELSEN == 'FARMA'), lng = ~long,lat= ~lat,label= ~ENDEREÇOS,color= ~factor_color(TIPO_NIELSEN), group = "FARMA",radius = 4, opacity = 0.3) %>%
  addCircleMarkers(data = WEBSCRAPING %>% filter(TIPO_NIELSEN == 'PERF'), lng = ~long,lat= ~lat,label= ~ENDEREÇOS,color= ~factor_color(TIPO_NIELSEN), group = "PERF",radius = 4, opacity = 0.7) %>%
  addLegend(title = "Tipo de Canal", pal = factor_color,
            values=c("AS","CELULAR","FARMA","PERF"),
            opacity=0.5,
            position = "bottomright") %>% 
  addLayersControl(overlayGroups = c("AS",
                                     "CELULAR",
                                     "FARMA",
                                     "PERF"),
                   baseGroups=c("OSM","Carto","Esri"),
                   position = "topright")%>% 
  addResetMapButton() 

saveWidget(map_web, file="web_map.html")



