

# Filter on regions -------------------------------------------------------

sub_data <- reactive({
  validate(need(input$region_select != "", "Pick a region"))
  dplyr::filter(current$data, region == current$region)
})


# Charts ------------------------------------------------------------------

output$region_stakedbar <- 
  renderPlotly({
  stackedbar_wh(data = sub_data(),
                year = current$year)
})

output$region_lines <-
  renderPlotly({
    lines_wh(data = sub_data(),
             indicator = current$indicator)
  })


# Valueboxes --------------------------------------------------------------

output$region_1st_rank <- renderValueBox({
  valueBox(
    value = min(sub_data()$rank), 
    subtitle = paste("1st Rank", current$best_country, sep = " : "), 
    icon = icon("medal"),
    color = "maroon"
  )
})

output$region_1st_score <- renderValueBox({
  valueBox(
    value = round(max(sub_data()$score), 3), 
    subtitle = paste("1st Score", current$best_country, sep = " : "), 
    icon = icon("star"),
    color = "maroon"
  )
})

output$region_mean_score <- renderValueBox({
  valueBox(
    value = round(mean(sub_data()$score), 3), 
    subtitle = "Mean Score", 
    icon = icon("star-half-alt"),
    color = "maroon"
  )
})


# Titles ------------------------------------------------------------------

output$region_lines_title <-
  renderUI({HTML(paste(
    "<h2>Evolution of", current$indicator, "by year</h2>"
  ))})

