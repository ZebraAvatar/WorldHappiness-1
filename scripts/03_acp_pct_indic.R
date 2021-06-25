

# 0 - Load packages ---------------------------------------------

library(data.table)
library(FactoMineR)
library(Factoshiny)
library(ggplot2)

# 1 - Load data ---------------------------------------------

wh_data <- readRDS("data/wh_data.RDS")


wh_data <- wh_data %>%
  mutate(
    pct_economy    = economy / score,
    pct_family     = family / score,
    pct_health     = health / score,
    pct_freedom    = freedom / score,
    pct_generosity = generosity / score,
    pct_trust      = trust / score
  )


# ACP 2015 ----------------------------------------------------------------


wh_2015 <- wh_data %>%
  filter(year == 2015) %>%
  select(country,
         region,
         rank,
         score,
         pct_economy,
         pct_family,
         pct_freedom,
         pct_health,
         pct_trust)

pca_2015 <- PCA(wh_2015, quanti.sup = c(3,4), quali.sup = c(1,2))

pca_2015$eig # 3 dimensions
pca_2015$var$coord
pca_2015$var$contrib


individus = data.frame(pca_2015$ind$coord, wh_2015) 

ggplot(data = individus, aes(x = Dim.1, y =  Dim.2, z = Dim.3)) +
  geom_text(aes(label = country, color = region)) +
  scale_color_discrete() 

