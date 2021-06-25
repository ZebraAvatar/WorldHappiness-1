wh_data <- readRDS('data/wh_data.RDS') # Import data
wh_part <- wh_data[,c(3:9)]

# Choose rows for data partition 
inTrain <- createDataPartition(y = wh_part$score,   # outcome variable
                               p = .70,   # % of training data you want
                               list = F)  # Do NOT put results in a list!

train <- wh_part[inTrain,]  # Create training data set
test <- wh_part[-inTrain,]  # Create test data set
rm(inTrain)                 # Clean up

set.seed(1234)
m1 = lm(score ~ ., data=train) # Create linear model
rm(wh_part)

output$country <- renderUI({
  selectInput("country", "Choose Your Country", choices=countries$country)
})

# Make Economy slider
output$economy_ui <- renderUI({
  wh_part <- wh_data %>%
    filter(country==input$country) %>%
    filter(year==max(year))
  sliderInput("economy", "Economy (GDP per Capita) ", 0, 
              round(max(wh_data$economy),2), wh_part$economy)
})

# Make family slider
output$family_ui <- renderUI({
  wh_part <- wh_data %>%
    filter(country==input$country) %>%
    filter(year==max(year))
  sliderInput("family", "Family & Other Personal Social Connections", 0,
              round(max(wh_data$family),2), wh_part$family)
})

# Make health slider
output$health_ui <- renderUI({
  wh_part <- wh_data %>%
    filter(country==input$country) %>%
    filter(year==max(year))
  sliderInput("health", "Health (Life Expectancy) ", 0,
              round(max(wh_data$health),2), wh_part$health)
})

# Make freedom slider
output$freedom_ui <- renderUI({
  wh_part <- wh_data %>%
    filter(country==input$country) %>%
    filter(year==max(year))
  sliderInput("freedom", "Freedom to make life choices ", 0,
              round(max(wh_data$freedom),2), wh_part$freedom)
})

# Make generosity slider
output$generosity_ui <- renderUI({
  wh_part <- wh_data %>%
    filter(country==input$country) %>%
    filter(year==max(year))
  sliderInput("generosity", "Generosity ", 0,
              round(max(wh_data$generosity),2), wh_part$generosity)
})

# Make trust slider
output$trust_ui <- renderUI({
  wh_part <- wh_data %>%
    filter(country==input$country) %>%
    filter(year==max(year))
  sliderInput("trust", "Trust ", 0, round(max(wh_data$trust),2), wh_part$trust)
})

# Make box at the bottom with description
output$scoreBox <- renderInfoBox({
  wh_2021 <- wh_data %>% 
    filter(country==input$country) %>%
    filter(year==max(year))
  wh_part <- wh_2021[,c(3:9)] # Grab only cols needed for model
  wh_part[,'economy'] <- input$economy
  wh_part[,'family'] <- input$family
  wh_part[,'health'] <- input$health
  wh_part[,'freedom'] <- input$freedom
  wh_part[,'generosity'] <- input$generosity
  wh_part[,'trust'] <- input$trust
    
  preds <- predict(m1, wh_part)
  result <- round(preds[[1]],3)
  infoBox(
    'Results',
    paste0(
      'Most recent happiness score for ',
      input$country,
      ' is ',
      wh_part$score,
      ', and the predicted score is ',
      result,
      '.'))
})