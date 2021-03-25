#####################################################################
##
## Script name:
##
## Author: Adam N. Price
##
## Date Created: 2021-03-16
##
## Copyright (c) Adam N. Price, 2021
## Email: adnprice@ucsc.edu
##
############################# Description ##########################
##
## Conceptual figure 3 code
##   
##
############################# Packages #############################
##
library(ggplot2)
library(sf)
library(rnaturalearth)
library(rnaturalearthdata)
library(scico)
##   
##
############################# Code ################################
world <- ne_countries(scale = "medium", returnclass = "sf")
class(world)

set.seed(42)
x = rnorm(150,0,45)
y = rnorm(150,0,45)
z = rlnorm(150,0,0.5)
z = z/max(z)
df = data.frame(cbind(x,y,z))


p = ggplot(data = world) +
  geom_sf(aes(fill=NULL))+
  geom_point(data=df,aes(x=x,y=y,color=z))+
  scale_color_scico(10,palette = 'vik')+
  theme_minimal()

p

pdf("docs/figure3.pdf")
p
dev.off()
