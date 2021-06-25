# # Filter on country -------------------------------------------------------
# 
# sub_data_country <- reactive({
#   validate(need(input$country_select != "", ""))
#   dplyr::filter(current$data, country == current$country)
# })
# 
# sub_data_region <- reactive({
#   validate(need(input$country_select != "", ""))
#   dplyr::filter(current$data, region == current$region)
# })
# 
# best_year <- reactive({
#   paste(filter(sub_data_country(), rank == min(sub_data_country()$rank))$year,
#         collapse = ", ")
# })

# Charts ------------------------------------------------------------------

# output$country_area <-
#   renderPlotly({
#     areachart_wh(data = sub_data_country())
#   })


by_country <- function(){
  wh_data %>% 
    filter(country==input$cntry_select) %>%
    arrange(year) %>%
    select(country, year,rank, score,economy, family, health,freedom, generosity,trust)
}

output$country_table <- renderTable({
  by_country()
})

# server <- function(input, output) {
#   by_country <- function(){
#     wh_data %>% 
#       filter(country==input$cntry_select) %>%
#       arrange(year) %>%
#       select(country, year,rank, score,economy, family, health,freedom, generosity,trust)
#   }
# 
#   output$country_table <- renderTable({
#     by_country()
#   })
# 
#   cntry_data <-  wh_data %>% 
#     filter(country==input$cntry_select) 
# 
#   group=c('economy', 'family', 'health','freedom', 'generosity','trust')
# 
#   output$cntry_plot <- renderPlot({
#     ggplot(cntry_data, aes(x=year, y=score, fill=group))+geom_area()
#   })
# }
# 
# cntry_data <-  wh_data %>% 
#   filter(country=='Iran') 
# class(cntry_data)
# year <- as.numeric(rep(seq(2016,2021),each=6))
# score <- runif(8,0,10)
# group=rep(c('economy', 'family', 'health','freedom', 'generosity','trust'),times=6)
# cntry_data <-data.frame(year, score,group)
# ggplot(cntry_data, aes(x=year, y=score, fill=group))+geom_area()

# # Valueboxes --------------------------------------------------------------
# 
# output$country_1st_rank <- renderValueBox({
#   valueBox(
#     value = min(sub_data_country()$rank),
#     subtitle = paste("Best Rank", best_year(), sep = " : "),
#     icon = icon("medal"),
#     color = "maroon"
#   )
# })
# 
# output$country_1st_score <- renderValueBox({
#   valueBox(
#     value = round(max(sub_data_country()$score), 3),
#     subtitle =  paste("Best Score", best_year(), sep = " : "),
#     icon = icon("star"),
#     color = "maroon"
#   )
# })
# 
# output$country_mean_score <- renderValueBox({
#   valueBox(
#     value = round(mean(sub_data_region()$score), 3),
#     subtitle = paste("Mean Regional Score", current$mean_region),
#     icon = icon("star-half-alt"),
#     color = "maroon"
#   )
# })