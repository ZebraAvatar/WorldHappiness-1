radioTooltip <- function(id, choice, title, placement = "bottom", trigger = "hover", options = NULL){
  
  options = shinyBS:::buildTooltipOrPopoverOptionsList(title, placement, trigger, options)
  options = paste0("{'", paste(names(options), options, sep = "': '", collapse = "', '"), "'}")
  bsTag <- shiny::tags$script(shiny::HTML(paste0("
    $(document).ready(function() {
      setTimeout(function() {
        $('input', $('#", id, "')).each(function(){
          if(this.getAttribute('value') == '", choice, "') {
            opts = $.extend(", options, ", {html: true});
            $(this.parentElement).tooltip('destroy');
            $(this.parentElement).tooltip(opts);
          }
        })
      }, 500)
    });
  ")))
  htmltools::attachDependencies(bsTag, shinyBS:::shinyBSDep)
}

body_content[[length(body_content) + 1]] <-
  tabItem(
    "home",
    h1("Welcome to the World Happiness Report Shiny App"),
    br(),
    column(
      width = 4,
      p(
        "This app allows you to observe, compare, and predict the World Happiness Report
            score and/or indicators using data from 2015 to 2021. This data came from Gallup World Poll."
      ),
      p(
        HTML(
          "<i>More information about the dataset available in Info tab</i>"
        )
      ),
      
      h3("Map by Happiness Score or a Selected Indicator"),
      p(
        ""
      ),
      br(),
      p(""),
      
      
      radioGroupButtons(
        inputId = "home_indicators",
        label = "Choose an indicator:",
        choices = c(
          `<i class='fa fa-star'></i>`                = "score", 
          `<i class='fa fa-sort-amount-up'></i>`      = "rank", 
          `<i class='fa fa-hand-holding-usd'></i>`    = "economy", 
          `<i class='fa fa-child'></i>`               = "family", 
          `<i class='fa fa-heartbeat'></i>`           = "health", 
          `<i class='fa fa-dove'></i>`                = "freedom", 
          `<i class='fa fa-handshake'></i>`           = "trust", 
          `<i class='fa fa-hand-holding-heart'></i>`  = "generosity"
        ),
        justified = TRUE
      ),
      
      radioTooltip(id = "home_indicators", choice = "score", title = "Overall Life Ladder Score", placement = "top", trigger = "hover"),
      radioTooltip(id = "home_indicators", choice = "rank", title = "Rank", placement = "top", trigger = "hover"),
      radioTooltip(id = "home_indicators", choice = "economy", title = "Economy: GDP per Capita", placement = "top", trigger = "hover"),
      radioTooltip(id = "home_indicators", choice = "family", title = "Family: Social Support", placement = "top", trigger = "hover"),
      radioTooltip(id = "home_indicators", choice = "health", title = "Health: Life Expectancy", placement = "top", trigger = "hover"),
      radioTooltip(id = "home_indicators", choice = "freedom", title = "Freedom: Freedom to Make Life Choices", placement = "top", trigger = "hover"),
      radioTooltip(id = "home_indicators", choice = "trust", title = "Trust: Perception of Corruption", placement = "top", trigger = "hover"),
      radioTooltip(id = "home_indicators", choice = "generosity", title = "Generosity: Recently Donating to Charities", placement = "top", trigger = "hover"),
      
      sliderTextInput(
        inputId = "home_years",
        label = "Pick a year:",
        choices = years,
        width = "100%"
      )
      
    ),
    column(width = 8,
           plotlyOutput("home_map")
    )
    
  )

