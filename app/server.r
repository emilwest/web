#install.packages("shiny")
#install.packages("devtools")
#install.packages("lazyeval") #used for rbokeh
#devtools::install_github('bokeh/rbokeh')
#install.packages("magrittr") #for piping %>%


library(shiny)
library(ggplot2)
library(magrittr)
library(rbokeh)



shinyServer(function(input,output){
    output$DiamondsPlot <- renderPlot({
        ggplot(diamonds[diamonds$cut %in% input$checkGroup_cut, ],
               aes(x=carat, y = price, color=cut)) + geom_point()
    })
    
    data(diamonds, package="ggplot2")
    head(diamonds)
    
    # loads diamond dataset from ggplot package
   output$BokehPlot <- renderRbokeh({
       figure() %>% ly_points(carat, price, data=diamonds, color=cut)
       
   })
       
    
})


