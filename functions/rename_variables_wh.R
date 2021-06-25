# library(stringr)
# library(data.table)
rename_variables_wh <- function(wh_data){
  c_names <- colnames(wh_data)
  
  # country
  c_names[str_detect(string = c_names, pattern = "[Cc]ountry")] <- "country"
  
  # rank
  c_names[str_detect(string = c_names, pattern = "[Rr]ank")] <- "rank"
  
  # score
  c_names[str_detect(string = c_names, pattern = "[Ss]core")] <- "score"
  
  # economy = GPD per capita
  c_names[str_detect(string = c_names, pattern = "[Ee]conomy|GDP")] <- "economy"
  
  # family = Social support
  c_names[str_detect(string = c_names, pattern = "[Ff]amily|[Ss]ocial|[Ss]upport")] <- "family"
  
  # health = Life Expectancy
  c_names[str_detect(string = c_names, pattern = "[Hh]ealth")] <- "health"
  
  # freedom
  c_names[str_detect(string = c_names, pattern = "[Ff]reedom")] <- "freedom"
  
  # generosity
  c_names[str_detect(string = c_names, pattern = "[Gg]enerosity")] <- "generosity"
  
  # trust = perception of corruption
  c_names[str_detect(string = c_names, pattern = "[Tt]rust|[Cc]orruption")] <- "trust"
  
  # Restriction aux variables concernées
  colnames(wh_data) <- c_names
  data <- data.frame(country = wh_data$country,
                sapply(wh_data[, .(rank, score, economy, family, health, freedom, generosity, trust)], as.numeric),
                stringsAsFactors = FALSE) %>% 
    as.data.table()
  
  # dystopia value
  data[, dystopia := score - economy - family - health - freedom - generosity - trust]

  return(data)
}

