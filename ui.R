

# Initialization ----------------------------------------------------------

side_content <- list()
body_content <- list()

files_UI <- list.files("UI/")
for(f in file.path(getwd(), "UI", files_UI)){
  source(f, local = TRUE)
}


# Header ------------------------------------------------------------------
header <- dashboardHeader(title = "World Happiness",
                          titleWidth = 450)


# Sidebar -----------------------------------------------------------------
side <- dashboardSidebar(
  side_content
)

# Body --------------------------------------------------------------------
body <- dashboardBody(
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "style.css")
  ),
  tags$div(body_content, class = "tab-content" )
)

# Page --------------------------------------------------------------------
dashboardPage(skin = "black",
              title = "World Happiness",
              header, side, body)



# The map can take a moment to load