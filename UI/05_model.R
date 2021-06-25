body_content[[length(body_content) + 1]] <-
  tabItem(
    "model",
    
  box(title="Linear Model", solidHeader=T,
    plotOutput("lmPlot", height=800), width=10),
  
  box(title='Summary of Model Statistics', solidHeader=T,
      verbatimTextOutput('lmSum'), width=5),
  box(title='Linear model', solidHeader=T,
      verbatimTextOutput('lm'), width=5)
  )