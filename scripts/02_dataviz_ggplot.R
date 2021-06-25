
# 0 - Load packages ----------------------------------------------
library(ggplot2)
library(dplyr)
library(scales)
library(plotly)

# 1 - Load data ---------------------------------------------

wh_data <- readRDS("data/wh_data.RDS")

# Mise en format canaux de représentation
wh_data <- melt(wh_data, id.vars = c("country","region", "year", "score", "rank"))



# For a specific year ----------------------------------------------------

wh_data %>%
  filter(year == 2015 & region == "Southern Asia") %>%
  ggplot(aes(reorder(country,-rank), value, fill = reorder(variable,-value))) +
  geom_bar(stat = "identity") +
  scale_fill_brewer(palette = "Set2") +
  coord_flip(ylim = c(0, 8)) +
  theme(legend.position = "top",
        legend.justification = "left") +
  guides(fill = guide_legend(nrow = 1, title = NULL, reverse = TRUE)) +
  labs(
    title = "Money makes happy",
    subtitle = "Score and extents of factors of happiness level in 2015 by country",
    caption = "Source: The World Happiness Report",
    x = NULL,
    y = NULL,
    size = "Population"
  )





# For a chosen country -------------------------------------------------------

wh_data %>% 
  filter(country == "Honduras") %>% 
  ggplot(aes(x=year, y=value, fill=reorder(variable,value))) +
  geom_area() +
  scale_fill_brewer(palette = "Set3")

# For a selected indicator -------------------------------------------------

wh_data %>%
  filter(variable == "economy") %>%
  ggplot(aes(country, year, size = value/score)) +
  geom_point()

