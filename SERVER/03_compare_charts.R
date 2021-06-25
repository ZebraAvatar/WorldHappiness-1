library(ggcorrplot)
library(corrplot)

compare_filter <- reactive({
  validate(need(input$compare_select != "", "Choose countries"))
  dplyr::filter(current$data, country %in% current$compare)
})

output$compare_stakedbar <- 
  renderPlotly({
  stackedbar_wh(data = compare_filter(),
                year = current$year)
})

output$compare_lines <-
  renderPlotly({
    lines_wh(data = compare_filter(),
             indicator = current$indicator)
  })

#Stacked bar top 5
output$top5 <-
  renderPlotly({
    wh_data_top5 <- summarize(group_by(wh_data,country), mean_score=mean(score), mean_econ=mean(economy),mean_fam=mean(family), 
              mean_health=mean(health), mean_free=mean(freedom), mean_gener=mean(generosity),mean_trust=mean(trust),
              mean_dystopia=mean(dystopia))
    wh_data_top5 <- wh_data_top5 %>% arrange(desc(mean_score)) %>% slice_head(n=5)
    wh_data_top5 <- wh_data_top5 %>% select(country, mean_score, mean_econ, mean_fam, mean_health, mean_free, mean_gener,mean_trust, mean_dystopia)
    #class(wh_data_top5)
    fig <- plot_ly(wh_data_top5, x = ~country, y = ~ mean_dystopia, type = 'bar', name = 'Unexplained')
    fig <- fig %>% add_trace(y = ~mean_econ, name = 'Economy')
    fig <- fig %>% add_trace(y = ~mean_fam, name = 'Family')
    fig <- fig %>% add_trace(y = ~mean_health, name = 'Health')
    fig <- fig %>% add_trace(y = ~mean_free, name = 'Freedom')
    fig <- fig %>% add_trace(y = ~mean_gener, name = 'Generosity')
    fig <- fig %>% add_trace(y = ~mean_trust, name = 'Trust')
    fig <- fig %>% layout(yaxis = list(title = 'Score'), barmode = 'stack')
    fig
  })

#Stacked bar bottom 5
output$bottom5 <-
  renderPlotly({
    wh_data_bottom5 <- summarize(group_by(wh_data,country), mean_score=mean(score), mean_econ=mean(economy),mean_fam=mean(family), 
                              mean_health=mean(health), mean_free=mean(freedom), mean_gener=mean(generosity),mean_trust=mean(trust),
                              mean_dystopia=mean(dystopia))
    wh_data_bottom5 <- wh_data_bottom5 %>% arrange(mean_score) %>% slice_head(n=5)
    wh_data_bottom5 <- wh_data_bottom5 %>% select(country, mean_score, mean_econ, mean_fam, mean_health, mean_free, mean_gener,mean_trust, mean_dystopia)
    fig <- plot_ly(wh_data_bottom5, x = ~country, y = ~ mean_dystopia, type = 'bar', name = 'Unexplained')
    fig <- fig %>% add_trace(y = ~mean_econ, name = 'Economy')
    fig <- fig %>% add_trace(y = ~mean_fam, name = 'Family')
    fig <- fig %>% add_trace(y = ~mean_health, name = 'Health')
    fig <- fig %>% add_trace(y = ~mean_free, name = 'Freedom')
    fig <- fig %>% add_trace(y = ~mean_gener, name = 'Generosity')
    fig <- fig %>% add_trace(y = ~mean_trust, name = 'Trust')
    fig <- fig %>% layout(yaxis = list(title = 'Score'), barmode = 'stack')
    fig
  })


#Correlation matrix
wh_data <- readRDS("data\\wh_data.RDS")
output$indicator_corr <- renderPlot({
  wh_data_yr <- wh_data[which(wh_data$year==input$corr_yr)][,3:9]
  cor_matrix <- cor(wh_data_yr)
  ggcorrplot(cor_matrix, method = "circle", colors = c("red","pink","blue"))
})

# Titles ------------------------------------------------------------------

output$compare_lines_title <-
  renderUI({HTML(paste(
    "<h2>Evolution of", current$indicator, "by year</h2>"
  ))})


