body_content[[length(body_content) + 1]] <-
  tabItem("info",
          h1("Information"),
          p(
            HTML(
              "<i><a href = \"https://www.kaggle.com/unsdsn/world-happiness\">
                 source : https://www.kaggle.com/unsdsn/world-happiness<br>
             <a href=\"https://worldhappiness.report/ed/2020\">
                 source: https://https://worldhappiness.report/ed/2020/<br>
             <a href=\"https://worldhappiness.report/ed/2021\">
                 source: https://https://worldhappiness.report/ed/2021/</a></i>"

            )
          ),
          
          br(),
          h2("Context"),
          p("The World Happiness Report is a landmark survey of the state of 
            global happiness. The first report was published in 2012. The report continues 
            to gain global recognition as governments, organizations and civil 
            society increasingly use happiness indicators to inform their 
            policy-making decisions. Leading experts across fields in economics, 
            psychology, survey analysis, national statistics, health, public 
            policy and more describe how measurements of well-being can be 
            used effectively to assess the progress of nations. The reports 
            review the state of happiness in the world today and show how the 
            new science of happiness explains personal and national variations 
            in happiness."), 
          
          h2("Content"),
          p("The happiness scores and rankings use data from the Gallup World 
            Poll. The scores are based on answers to the main life evaluation 
            question asked in the poll. This question, known as the Cantril 
            ladder, asks respondents to think of a ladder with the best possible 
            life for them being a 10 and the worst possible life being a 0 and 
            to rate their own current lives on that scale. The scores are from 
            nationally representative samples for the years 2015-2021 and use 
            the Gallup weights to make the estimates representative. The report provides
            the extent to which each of six factors: levels of GDP, life expectancy,
            generosity, social support, freedom, and corruption contribute to 
            making life evaluations higher in each country than they are in 
            Dystopia, a hypothetical country that has values equal to the 
            world's lowest national averages for each of the six factors. 
            They have no impact on the total score reported for each country, 
            but they do explain why some countries rank higher than others."),
          
          # h2("Inspiration"),
          # p("What countries or regions rank the highest in overall happiness 
          #   and each of the six factors contributing to happiness? How did 
          #   country ranks or scores change between the 2015 and 2016 as well 
          #   as the 2016 and 2017 reports? Did any country experience a 
          #   significant increase or decrease in happiness?"),

          h4("What is Dystopia?"), 
          p("Dystopia is an imaginary country that has the world's least-happy 
            people. The purpose in establishing Dystopia is to have a benchmark 
            against which all countries can be favorably compared (no country 
            performs more poorly than Dystopia) in terms of each of the six key 
            variables, thus allowing each sub-bar to be of positive width. The 
            lowest scores observed for the six key variables, therefore, 
            characterize Dystopia. Since life would be very unpleasant in a 
            country with the world's lowest incomes, lowest life expectancy, 
            lowest generosity, most corruption, least freedom and least social 
            support, it is referred to as 'Dystopia', in contrast to Utopia."),
          
          h4("What are the residuals?"), 
          p("The residuals, or unexplained components, differ for each country, 
            reflecting the extent to which the six variables either 
            over- or under-explain average life evaluations. 
            These residuals have an average value of approximately zero over the 
            whole set of countries."),

          h4("What do the columns succeeding the Happiness Score(like Family, 
             Generosity, etc.) describe?"),
          p("The following columns: GDP per Capita, Family, Life Expectancy, 
            Freedom, Generosity, Trust Government Corruption describe the extent 
            to which these factors contribute in evaluating the happiness in 
            each country. The Dystopia Residual metric actually is the Dystopia 
            Happiness Score(1.85) + the Residual value or the unexplained value 
            for each country as stated in the previous answer."),
          )