library(rgbif)
library(leaflet)
library(dplyr)

marten <- occ_search(scientificName = "Martes flavigula",
                      hasCoordinate=T, basisOfRecord='HUMAN_OBSERVATION', limit = 1000) 
marten2 <- marten$data

marten3 <- leaflet (data = marten2) %>%
  addTiles() %>%
  addCircleMarkers(
    lng = ~decimalLongitude, 
    lat = ~decimalLatitude,
    color = "orange", 
    radius = 2) %>%
  setView (lng = 120.96, lat = 23.6, zoom = 7)%>%
  addControl(html = "<strong> Distribution of Yellow-throated marten </strong>", position = "topright")

marten3
