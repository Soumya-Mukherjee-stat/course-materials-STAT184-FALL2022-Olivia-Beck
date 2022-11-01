#================
# import packages
#================
library(tidyverse)
library(sf)
library(ggspatial)
library(rnaturalearth)
library(tidygeocoder)
library(maps)
library(ggrepel)
library(rayshader)


#=============
# GET MAP DATA
#=============
world_map_data <- ne_countries(scale = "medium", returnclass = "sf")
state_map_data <- map('state', fill = TRUE, plot = FALSE) %>% st_as_sf()

class(world_map_data)
class(state_map_data)



#------------------
# CREATE SIMPLE MAP
#------------------
SAT2 <- SAT_2010 %>%
  mutate(state = tolower(state)) %>%
  filter(!(state) %in% c("alaska", "hawaii")) 

state_map_data <- state_map_data %>%
  filter(ID != "district of columbia")

state_map_data$color <- log(SAT2$pupil_teacher_ratio)


gg_map<- ggplot() +
  geom_sf(data = state_map_data, aes(fill = color))

plot_gg(gg_map, multicore = TRUE, 
        scale = 300,  zoom = 0.75, 
        phi = 50, sunangle = -60, theta = 45)
render_snapshot()
