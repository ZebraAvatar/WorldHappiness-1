body_content[[length(body_content) + 1]] <-
  tabItem(
  "compare",
  br(),
  box(title="Correlation matrix for all years and all countries", solidHeader = T,
         sliderTextInput(inputId='corr_yr',
                         label='Pick a year',
                         choices=years,
                         width ='80%'),
         plotOutput("indicator_corr", height=400),width=5
  ),
  box(title='Top 5 Happiest Countries- all years', solidHeader = T,plotlyOutput('top5', height=290), width=5),
  box(title='Bottom 5 Least Happy Countries- all years', solidHeader = T,plotlyOutput('bottom5', height=290), width=5)
  )
