# ===============================================================================
# Thesis: Paper01 - Biodiversity x Sustainability
# Graphics
# Author: Ricardo Reale, realericardo[ at ]gmail[ dot ]com
# Created: 14 Jan 2021
# Last commit: 09 Apr 2021
# ===============================================================================
# Packages:
# ggplot2, readxl, readr, tidyverse, gapminder, hrbrthemes, gganimate
# ===============================================================================
# 
# Set as directory
# setwd("YOUR_DIRECTORY") #>>Change directory
# library
library(ggplot2)
library(readxl)
library(readr)
library(tidyverse)
library(gapminder)
library(hrbrthemes)
library(gganimate)

All_regions <- read.csv("YOUR_DIRECTORY/Total_01.csv")

#########################################################################
# (1) BCA_min TOTAL x Biome (grouped by Company)
ggplot(All_regions, aes(x=(BCA_min/1e3) , y=Unit, fill=Ecoregion)) + 
  geom_boxplot() +
  geom_point(aes(colour = factor(River_Basin), shape = factor(Biome))) +
  labs(
    y = "Productive Units analyzed between 2011 to 2018",
    x = "Scores of BCAmin (x1,000)", 
    colour = "River Basin",
    shape = "Biome"
  ) +
  theme_ipsum() +
  theme(axis.text.y = element_text(angle = 0, hjust = 1, size = 8)) +
  theme(axis.text.x = element_text(angle = 0, hjust = 1, size = 10)) +
  theme(axis.title.x = element_text(size = 10)) +
  theme(axis.title.y = element_text(size = 10)) +
  theme(legend.text = element_text(size = 8)) +
  theme(legend.title = element_text(size = 10))
#########################################################################

#########################################################################
# (2) BCA_dev TOTAL x Biome (grouped by Company)
ggplot(All_regions, aes(x=BCA_achieved , y=Unit, fill=Ecoregion)) + 
  geom_boxplot() +
  geom_point(aes(colour = factor(River_Basin), shape = factor(Biome))) +
  labs(
    y = "Productive Units analyzed between 2011 to 2018",
    x = "Scores of BCAachieved (x1,000)", 
    colour = "River Basin",
    shape = "Biome"
  ) +
  theme_ipsum() +
  theme(axis.text.y = element_text(angle = 0, hjust = 1, size = 8)) +
  theme(axis.text.x = element_text(angle = 0, hjust = 1, size = 10)) +
  theme(axis.title.x = element_text(size = 10)) +
  theme(axis.title.y = element_text(size = 10)) +
  theme(legend.text = element_text(size = 8)) +
  theme(legend.title = element_text(size = 10))
#########################################################################

#########################################################################
# (3) % de Mitigação de BCA minimo x Biome (grouped by Company)
ggplot(All_regions, aes(x=(BCA_achieved/BCA_min)*100 , y=Unit, fill=Ecoregion)) + 
  geom_boxplot() +
  geom_point(aes(colour = factor(River_Basin), shape = factor(Biome))) +
  labs(
    y = "Productive Units analyzed between 2011 to 2018",
    x = "% of impact mitigations (BCAachieved/BCAmin)", 
    colour = "River Basin",
    shape = "Biome"
  ) +
  theme_ipsum() +
  theme(axis.text.y = element_text(angle = 0, hjust = 1, size = 8)) +
  theme(axis.text.x = element_text(angle = 0, hjust = 1, size = 10)) +
  theme(axis.title.x = element_text(size = 10)) +
  theme(axis.title.y = element_text(size = 10)) +
  theme(legend.text = element_text(size = 8)) +
  theme(legend.title = element_text(size = 10))
#########################################################################



# (4) TESTES divisões nos gráficos
All_regions %>% 
  ggplot(aes(x=((BCA_achieved/BCA_min)*100), y=Unit, fill=Company)) +
  geom_bin2d() + 
  facet_wrap(Ecoregion~River_Basin, ncol=6) +
  theme_ipsum() +
  xlab("% of impact mitigations (BCAachieved/BCAmin)") + 
  ylab("Entire companies analyzed between 2011 to 2018") +
  theme(axis.text.y = element_text(angle = 0, hjust = 1, size = 1)) +
  theme(axis.text.x = element_text(angle = 0, hjust = 1, size = 8)) +
  theme(axis.title.x = element_text(size = 10)) +
  theme(axis.title.y = element_text(size = 10)) +
  theme(legend.text = element_text(size = 10)) +
  theme(legend.title = element_text(size = 10)) +
  theme(strip.text.x = element_text(size = 10))

All_regions %>% 
  ggplot(aes(x=factor(Year), y=(BCA_achieved), fill=Company)) +
  geom_bin2d() +
  geom_jitter(width=0.1,alpha=0.1) +
 # geom_point(aes....Acrescenta marcadores (colour and shape)).
 #geom_point(aes(colour = factor(River_Basin), shape = factor(Biome))) +
 labs(
   y = "Scores of BCAachieved",
   x = "Year"
   #colour = "River Basin",
   #shape = "Biome"
 ) +
  #facet_grid(~ Ecoregion, scale="free_y") +
  facet_wrap(Biome~River_Basin) +
  theme_ipsum() +
  #xlab("Year") + 
  #ylab("BCAachieved (x1,000)") +
  #ylab("% of impact mitigations (BCAachieved/BCAmin)") +
  theme(axis.text.y = element_text(angle = 0, hjust = 1, size = 9)) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1, size = 9)) +
  theme(axis.title.x = element_text(size = 12)) +
  theme(axis.title.y = element_text(size = 12)) +
  theme(legend.text = element_text(size = 10)) +
  theme(legend.title = element_text(size = 10)) +
  theme(strip.text.x = element_text(size = 10))

###############################################################################################






