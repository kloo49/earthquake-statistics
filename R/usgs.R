library(sf)          # vector handling
library(terra)       # raster handling
library(tidyverse)
library(tmap)        # map making
library(raster)
library(stars)

geology_rast <- rast('data/USGS__1.tif')
# summary(geology_rast)

# geology <- as.polygons(elevation_final) %>%
#   st_as_sf()

# tm_shape(geology_rast) +
#   tm_raster()

# usgs_features <- st_read(here::here('data','USGS_StateGeologicMapCompilation_GeMS.gdb'))

multiunitpolys <- st_read('data/GeMS_shapefiles/MapUnitPolys.shp') |> 
  # Add column to consolidate rock type
  mutate(type = word(Symbol))
# remove commas
multiunitpolys$type <- gsub(",","",multiunitpolys$type)

# unique(multiunitpolys$Symbol)

tm_shape(multiunitpolys) +
  tm_polygons(fill = 'Symbol',
              fill.legend = tm_legend('Rock Type'))
