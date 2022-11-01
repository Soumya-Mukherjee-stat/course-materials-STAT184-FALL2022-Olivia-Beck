#https://rpubs.com/Wyclife/mapping_3D

kenya <- raster::getData('GADM', country = 'KEN', level = 1) 

kenya_sf <- kenya %>% st_as_sf()

clim <- raster::getData('worldclim', var = 'tmin', res = 10)

clim_masked <- clim %>% 
  raster::crop(kenya_sf) %>% 
  raster::mask(kenya_sf)

clim_july <- clim_masked[[7]] %>% 
  raster::extract(kenya_sf, fun = mean) %>% 
  as.data.frame() %>% 
  mutate(July_tmin = V1/10) %>% 
  dplyr::select(July_tmin)

kenya_sf_mutate <- kenya_sf %>% mutate(clim_july)

kenya_sf_transformed <- kenya_sf_mutate %>% st_transform(21097)

mf_init(kenya_sf_transformed, theme = 'iceberg')
mf_shadow(kenya_sf_transformed, col = 'purple', cex = 2)
mf_map(kenya_sf_transformed, add = TRUE)
mf_map(kenya_sf_transformed, var = 'July_tmin', type = 'choro', pal = 'Greens', add = TRUE)
mf_layout(title = 'Kenya Counties Temperature',
          credits = paste0("Data source: GADM and worldclim ", 'mapsf ',
                           packageVersion('mapsf')))

gg_shp <- ggplot(data = kenya_sf_transformed) +
  geom_sf(aes(fill = July_tmin)) +
  scale_fill_viridis() +
  ggtitle('Minimum temperature Kenya') +
  theme_bw()
plot_gg(gg_shp, multicore = TRUE, width = 5, height = 5, 
        scale = 200, windowsize = c(1280, 720), zoom = 0.65, 
        phi = 50, sunangle = 60, theta = 45)
render_snapshot()


##########################################

library("rnaturalearth")
library("rnaturalearthdata")
world <- ne_countries(scale = "medium", returnclass = "sf")

library("maps")
states <- st_as_sf(map("state", plot = FALSE, fill = TRUE))
states <- cbind(states, st_coordinates(st_centroid(states)))

library("tools")
states$ID <- toTitleCase(states$ID)

ggplot(data = world) +
  geom_sf() +
  geom_sf(data = states, fill = NA) + 
  geom_text(data = states, aes(X, Y, label = ID), size = 5) +
  coord_sf(xlim = c(-88, -78), ylim = c(24.5, 33), expand = FALSE)
