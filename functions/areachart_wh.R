
areachart_wh <- function(data){
data %>%
  plot_ly(
    x = ~ year,
    y = ~ economy,
    name = 'Economy',
    hovertemplate  = '%{x} : %{y}',
    type = 'scatter',
    mode = 'none',
    stackgroup = 'one',
    fillcolor = colors_wh$economy
  ) %>% 
  add_trace(
    y = ~ family,
    hovertemplate  = '%{x} : %{y}',
    name = 'Family',
    fillcolor = colors_wh$family
  )  %>%
  add_trace(
    y = ~ health,
    hovertemplate  = '%{x} : %{y}',
    name = 'Health',
    fillcolor = colors_wh$health
  ) %>%
  add_trace(
    y = ~ freedom,
    hovertemplate  = '%{x} : %{y}',
    name = 'Freedom',
    fillcolor = colors_wh$freedom
  ) %>%
  add_trace(
    y = ~ generosity,
    hovertemplate  = '%{x} : %{y}',
    name = 'Generosity',
    fillcolor = colors_wh$generosity
  ) %>%
  add_trace(
      y = ~ trust,
      hovertemplate  = '%{x} : %{y}',
      name = 'Trust',
      fillcolor = colors_wh$trust
    ) %>%
  add_trace(
    y = ~ dystopia,
    hovertemplate  = '%{x} : %{y}',
    name = 'Dystopia',
    fillcolor = colors_wh$dystopia
  ) %>% 
  layout(
    xaxis = list(title = "",
                 type = 'category',
                 showgrid = FALSE),
    yaxis = list(title = "",
                 showgrid = FALSE),
    margin = list(autoexpand = FALSE,
                  r = 150)
  )
}


