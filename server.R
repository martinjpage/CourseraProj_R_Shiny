library(shiny)
library(leaflet)
library(tidyverse)
library(readr)
library(lubridate)
library(plotly)

shinyServer(function(input, output) {
    
    #============data============#
    
    url <- "https://raw.githubusercontent.com/martinjpage/datasciencecoursera/master/RSACovid.csv"
    data <- read_csv(url)
    
    #============Text============#
    
    output$day <- renderText(paste(as.character(day(input$date)), as.character(month(input$date, label = TRUE)),
                                   as.character(year(input$date))))
    
    #============Plot============#
    
    output$plot1 <- renderLeaflet({
        df <- data %>% filter(Date == input$date)
        leaflet() %>% addTiles() %>% 
            addCircleMarkers(lat = df$latit, lng = df$long,
                             label  = as.character(df$Total), 
                             radius = sqrt(df$Total), 
                             color = RColorBrewer::brewer.pal(9, "Set1"), opacity = 0.8)
    })
    

})

