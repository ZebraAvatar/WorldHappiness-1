side_content[[length(side_content) + 1]] <-
  sidebarMenu(
    menuItem(
      text    = "World Map",
      tabName = "home",
      startExpanded = TRUE),
    menuItem(text    = "Country",
             tabName = "country"),
    menuItem(text    = "Compare",
             tabName = "compare"),
    menuItem(text    = "Predict",
             tabName = "predict"),
    menuItem(text    = "Model",
             tabName = "model"),
    menuItem(text    = "Info",
             tabName = "info")
  )