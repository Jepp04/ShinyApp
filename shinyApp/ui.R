library(shiny)
library("shinyWidgets")
library(plotly)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Iris Linear Discriminant Training and Prediction "),
        tabsetPanel(
            tabPanel("Prediction",
                sidebarLayout(
                    sidebarPanel(
                        sliderTextInput(
                            inputId = "Category",
                            label = "Category slider:",
                            choices = colnames(iris)[1:4],
                            selected = colnames(iris)[1]
                        ),
                        sliderInput(
                            inputId = "RatioTraining"
                            ,label = "Ratio of data used for Training."
                            ,min = 10
                            ,max = 100
                            ,step = 10
                            ,value = 10
                        ),
                        actionButton("Train", "Train - It takes a few seconds")
                    ),
                    mainPanel(
                        plotlyOutput("distPlot"),
                        verbatimTextOutput("Results")
                    )
                )
            ),
            tabPanel("Documentation",
                htmlOutput("README")
            )
        )
))
