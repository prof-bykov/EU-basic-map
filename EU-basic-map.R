# How to make map of European Union in R & RStudio
# Author: ILYA BYKOV https://prof-bykov.blogspot.com/ 

# Part 1. Preparing

# Install R packages if necessary 
install.packages("sf", dependencies = TRUE) # sf is Simple Features for geographical data
install.packages("tidyverse", dependencies = TRUE) # packages like ggplot2, dplyr, stringr, etc.
install.packages("rnaturalearth", dependencies = TRUE) # world data from from Natural Earth

# Load R packages 
library("sf")
library("tidyverse")
library("rnaturalearth")

# Part 2. Preparing map

# Get world data
world <- ne_countries(scale = "small", returnclass = "sf") %>%
  filter(admin != "Antarctica")
# ne_countries contains the data from rnaturalearth package 
# small is for minimizing variables
# returnclass is for simple features

# Check world data if necessary 
view(world)

# Simple world map
world %>%
  ggplot() +
  geom_sf()

# Europe region 

world %>%
  ggplot() +
  geom_sf() +
  coord_sf(xlim = c(-20.0, 40.0), ylim = c(32.0, 70.0), expand = FALSE)
# xlim = left, right
# ylim = bottom, top