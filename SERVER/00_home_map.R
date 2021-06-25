output$home_map <- renderPlotly({
  map_wh(data      = current$data, 
         indicator = current$indicator,
         year      = current$year)
})

