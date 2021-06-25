stackedbar_wh <- function(data, year) {
  eval(parse(text = glue("data %>%
    filter(year == {year}) "))) %>% 
    plot_ly(
      x = ~ economy,
      y = ~ reorder(country, -rank),
      type = 'bar',
      orientation = 'h',
      hovertemplate  = '%{x}',
      name = 'Economy',
      marker = list(color = colors_wh$economy)
    ) %>%
    add_trace(
      x = ~ family,
      y = ~ reorder(country, -rank),
      hovertemplate  = '%{x}',
      name = 'Family',
      marker = list(color = colors_wh$family)
    )  %>%
    add_trace(
      x = ~ health,
      y = ~ reorder(country, -rank),
      hovertemplate  = '%{x}',
      name = 'Health',
      marker = list(color = colors_wh$health)
    ) %>%
    add_trace(
      x = ~ freedom,
      y = ~ reorder(country, -rank),
      hovertemplate  = '%{x}',
      name = 'Freedom',
      marker = list(color = colors_wh$freedom)
    ) %>%
    add_trace(
      x = ~ generosity,
      y = ~ reorder(country, -rank),
      hovertemplate  = '%{x}',
      name = 'Generosity',
      marker = list(color = colors_wh$generosity)
    ) %>%
    add_trace(
      x = ~ trust,
      y = ~ reorder(country, -rank),
      hovertemplate  = '%{x}',
      name = 'Trust',
      marker = list(color = colors_wh$trust)
    ) %>%
    add_trace(
      x = ~ dystopia,
      y = ~ reorder(country, -rank),
      hovertemplate  = '%{x}',
      name = 'Dystopia',
      marker = list(color = colors_wh$dystopia)
    ) %>% 
    layout(
      barmode = 'stack',
      showlegend = FALSE,
      xaxis   = list(title = "",
                     showgrid = FALSE,
                     zeroline = FALSE,
                     showline = FALSE,
                     showticklabels = FALSE),
      yaxis = list(
        title = "",
        showgrid = FALSE,
        zeroline = FALSE,
        showline = FALSE
      )
    )
}


