library(sf)
library(maptools)
library(rgdal)
library(tidyverse)
library(dplyr)
library(viridis)
library(foreign)
library(Hmisc)
library(lattice)
library(Formula)
library(aspace)
library(ggplot2)
library(sp)
library(paletteer)
library(ggspatial)
library(ggthemes)

name_list <- c("shanghai.shp", "beijing.shp", "nanjing.shp", "wuhan.shp", "tianjin.shp", "shenzhen.shp", "xian.shp", "guangzhou.shp", "chongqing.shp", "chengdu.shp", "hangzhou.shp")

input_name_list <- c("shanghai.tiff", "beijing.tiff", "nanjing.tiff", "wuhan.tiff", "tianjin.tiff", "shenzhen.tiff", "xian.tiff", "guangzhou.tiff", "chongqing.tiff", "chengdu.tiff", "hangzhou.tiff")

for (i in 1:length(name_list)){
    
    file_name <- name_list[i]
    
    file_path <- paste0("base_map/", file_name)
    base_map <- read_sf(file_path)
    
    base_map <- base_map %>% 
        st_set_crs(., 4326)
    
    file_path <- paste0("tertiary hospital/", file_name)
    only_third <- read_sf(file_path)
    
    only_third <- only_third %>%
        st_set_crs(., 4326)
    
    file_path <- paste0("secondary hospital/", file_name)
    second_level <- read_sf(file_path)
    
    second_level <- second_level %>%
        st_set_crs(., 4326)
    
    file_path <- paste0("primary hospital/", file_name)
    prim_level <- read_sf(file_path)
    
    prim_level <- prim_level %>%
        st_set_crs(., 4326)
    
    file_path <- paste0("other/", file_name)
    point_data <- read_sf(file_path)
    point_data <- point_data %>%
        st_set_crs(., 4326)
    
    file_path <- paste0("figure_1_base_map/", file_name)
    regression_base_1k <- read_sf(file_path)
    
    regression_base_1k <- regression_base_1k %>%
        st_set_crs(., 4326)
    
    
    g.base <- ggplot(data = regression_base_1k) + geom_sf(aes(fill = `end_price_`, geometry = `geometry`)) +
        scale_fill_viridis(name = "housing price", option = "viridis", alpha = 0.7, direction = -1) + 
        scale_color_viridis(option = "viridis", alpha = 0.7, direction = -1) +
        geom_point(data = point_data, aes(x=gpsx, y=gpsy), col = 'blue', alpha = 0.45, size=0.1) +
        theme_void() + # to set an empty background to avoid axis elements
        theme(# remove all axes
            axis.title.y = element_blank(),
            axis.title.x = element_blank(),
            axis.line = element_blank(),
            axis.text.x = element_blank(),
            axis.text.y = element_blank(),
            axis.ticks = element_blank()) + 
        scale_y_continuous(breaks = NULL) + scale_x_continuous(breaks = NULL) +
        annotation_scale(location = "bl", width_hint = 0.4) +
        annotation_north_arrow(location = "tr", which_north = "true", 
                               pad_x = unit(0.05, "in"), pad_y = unit(0.05, "in"),
                               style = north_arrow_nautical) 
    
    g.base
    
    output_name <- input_name_list[i]
    output_path1 = paste0("output_figure3/", output_name)
    ggsave(output_path1, width = 10, height = 6, dpi = 400)                   
}

