library(shiny)
library("shinyWidgets")

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("MTCARS Data Ratios"),
    sidebarLayout(
        sidebarPanel(
            sliderTextInput(
                inputId = "Category",
                label = "Category slider:",
                choices = colnames(mtcars),
                selected = colnames(mtcars)[1]
            ),
            actionButton("Dec", "-"),
            actionButton("Inc", "+")
        ),
        mainPanel(
            
            plotlyOutput("distPlot")
        )
    )
))
