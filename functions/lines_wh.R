lines_wh <- function(data, indicator) {
 cmd <- glue("data %>%
  plot_ly(
    type = 'scatter',
    mode = 'lines+markers',
    x = ~ year,
    y = ~ {indicator},
    color = ~ country,
    marker = list(color = 'rgb(148, 55, 142)'),
    line = list(color = 'rgb(148, 55, 142)')
    
  ) %>%
  add_lines() %>%
  add_annotations(
    data = filter(data,  year == max(years)),
    x = 1,
    y = ~ {indicator},
    text = ~ country,
    xref = 'paper',
    xanchor = 'left',
    yanchor = 'middle',
    showarrow = FALSE
  ) %>%
  layout(
    xaxis = list(title = ''),
    yaxis = list(
      title = '',
      showgrid = FALSE,
      zeroline = FALSE,
      showline = FALSE,
      showticklabels = FALSE
    ),
    margin = list(autoexpand = FALSE,
                  r = 100),
    showlegend = FALSE
  )")
 eval(parse(text = cmd))
}

