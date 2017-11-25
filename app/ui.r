library(shiny)

shinyUI(
    fluidPage(
        
        titlePanel("Min app"),
        sidebarLayout(
            sidebarPanel = sidebarPanel(
                inputPanel(
                    checkboxGroupInput(
                        inputId = "checkGroup_cut",
                        label = "diamond cut",
                        choices = list("Ideal", "Premium", "Good", "Fair"),
                        selected = "Ideal"
                    )
                )
            ),
            mainPanel = mainPanel(
               plotOutput("DiamondsPlot"),
               rbokehOutput("BokehPlot")
            )
        )
    )
    
)
