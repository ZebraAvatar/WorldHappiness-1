wh_data <- readRDS('data/wh_data.RDS') # Import data
wh_part <- wh_data[,3:9]               # Grab only cols needed for model
#rm(wh_data)

# Choose rows for data partition 
inTrain <- createDataPartition(y = wh_part$score,   # outcome variable
                               p = .70,   # % of training data you want
                               list = F)  # Do NOT put results in a list!

train <- wh_part[inTrain,]  # Create training data set
test <- wh_part[-inTrain,]  # Create test data set
rm(inTrain)                 # Clean up

set.seed(1234)
m1 = lm(score ~ ., data=train) # Create linear model

rdS <- defaultSummary(data=data.frame(obs=train$score, pred=predict(m1, newdata=train)),
               model=m1)
#      RMSE  Rsquared       MAE 
# 0.5511858 0.7553293 0.4293385 
# test m1
edS <- defaultSummary(data=data.frame(obs=test$score, pred=predict(m1, newdata=test)),
               model=m1)
#      RMSE  Rsquared       MAE 
# 0.5434960 0.7737548 0.4292699 

m1e <- predict(m1, newdata=test)  # Create preditctions on test set

r_te <- cor(x=test$score, y=m1e)  # Correlation between actuals and predicts

output$lmPlot <- renderPlot({
  ggplot(test, aes(x=score, y=m1e, size= -1*abs(score - m1e) + 1)) +
    geom_point(color='#13ab7b') + 
    geom_smooth(method = "lm", color='#AB1343') + #Trend line
    xlab('Actual Score') +
    ylab('Predicted score') +
    labs(size='Error') +
    ggtitle(paste0('Test Set, r=', round(r_te, 3)))
})

output$lmSum <- renderPrint(
  for (i in 1) {
    cat('   Train Set\t\t\t  |    Test Set\n')
    print(noquote(c(round(rdS,3), '|', round(edS, 3))))
  }
)

output$lm <- renderPrint({
  m1[1]
})