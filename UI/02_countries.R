body_content[[length(body_content) + 1]] <-
  tabItem("country",
          selectInput(
            inputId='cntry_select',
            label='Select a country',
            choices=unique(wh_data$country)),
          # pickerInput(
          #   inputId = "country_select",
          #   label = "", 
          #   choices = countries$country,
          #   width = "100%",
          #   options = list(
          #     title = "Pick a country",
          #     `live-search` = TRUE)
          # ),
          # fluidRow(
          #   valueBoxOutput("country_1st_rank"),
          #   valueBoxOutput("country_1st_score"),
          #   valueBoxOutput("country_mean_score")
          # ),
          br(),
          br(),
          h3("Indicators for Selected country throughout the Years"),
          tableOutput('country_table'),
          plotOutput('cntry_plot')
          # plotlyOutput("country_area")
  )


