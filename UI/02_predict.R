wh_data <- readRDS('data/wh_data.RDS') # Import data

body_content[[length(body_content) + 1]] <-
  tabItem(
    "predict",
    box(
      # Select Country
      uiOutput("country"),
      # Display sliders
      uiOutput("economy_ui"),
      uiOutput("family_ui"),
      uiOutput('health_ui'),
      uiOutput('freedom_ui'),
      uiOutput('generosity_ui'),
      uiOutput('trust_ui'),
      # Display info box
      infoBoxOutput("scoreBox", width = 8)
    )
  )