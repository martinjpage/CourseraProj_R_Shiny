library(shiny)


#add the user interface
shinyUI(fluidPage(
    
    titlePanel("Covid-19 Case Load in South African Provinces"),
            
      sidebarLayout(
                
        sidebarPanel(h3("Pick a day"),
                    dateInput("date", "Calendar:", value = "2020-03-24", min = "2020-03-24", max = "2020-05-24",
                              datesdisabled = c("2020-03-25", "2020-03-27", "2020-03-30", "2020-04-01", "2020-04-02", "2020-04-03", "2020-04-07", "2020-04-09", "2020-04-10",
                                                "2020-04-11", "2020-04-13", "2020-04-16", "2020-04-20", "2020-04-23", "2020-04-24", "2020-04-28", "2020-04-29", "2020-05-02",
                                                "2020-05-09", "2020-05-11")),
                    submitButton("Submit")),
                
                mainPanel(h3("Covid-19 Graph for:"),h3(textOutput("day")),
                          leafletOutput("plot1"))
            )
        )
)





#runApp(appDir = "C:/Users/Martin/OneDrive/Documents/Online Courses/Data Science_Johns Hopkins/CovidRSA")

