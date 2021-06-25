body_content[[length(body_content) + 1]] <-
  tabItem("region",
          pickerInput(
            inputId = "region_select",
            label = "", 
            choices = regions,
            width = "100%",
            options = list(
              title = "Pick a region")
          ),
          fluidRow(
            valueBoxOutput("region_1st_rank"),
            valueBoxOutput("region_1st_score"),
            valueBoxOutput("region_mean_score")
          ),
          br(),
          column(width = 6,
                 h2("Composition of score order by rank"),
                 plotlyOutput("region_stakedbar",
                              height = "400px"),
                 sliderTextInput(
                   inputId = "region_years",
                   label = "Pick a year:",
                   choices = years,
                   width = "100%"
                 )),
          column(width = 6,
                 htmlOutput("region_lines_title"),
                 plotlyOutput("region_lines"),
                 switchbuttons_indicator(
                   inputId = "region_indicators")
          )
  )
