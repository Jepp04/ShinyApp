#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
#library(plotly)
library(shiny)


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    sizeOut <- 500
    CurrentCategory <- colnames(mtcars)[0]
    data <- 0
    observeEvent(input$Category, {
        CurrentCategory <<- input$Category
        
        data <<- data.frame("Cars" = rownames(mtcars), mtcars)
        data <<- data[, c("Cars", CurrentCategory)]
        
        output$distPlot <- renderPlotly({
            plot_ly(data, labels = ~data[,"Cars"], values = ~data[,CurrentCategory], type = 'pie',
                    textposition = 'inside',
                    textinfo = 'label+percent',
                    insidetextfont = list(color = '#FFFFFF'),
                    hoverinfo = 'text',
                    width = sizeOut,
                    height = sizeOut,
                    showlegend = FALSE) %>%
            layout(title = paste("Ratios between the different cars based on",CurrentCategory),
                       xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
                       yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
        })
    })
    observeEvent(input$Inc, {
        sizeOut <<- sizeOut + 10
        output$distPlot <- renderPlotly({
            plot_ly(data, labels = ~data[,"Cars"], values = ~data[,CurrentCategory], type = 'pie',
                    textposition = 'inside',
                    textinfo = 'label+percent',
                    insidetextfont = list(color = '#FFFFFF'),
                    hoverinfo = 'text',
                    width = sizeOut,
                    height = sizeOut,
                    showlegend = FALSE) %>%
                layout(title = paste("Ratios between the different cars based on",CurrentCategory),
                       xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
                       yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
        })
        })
    observeEvent(input$Dec, {
        sizeOut <<- sizeOut - 10
        output$distPlot <- renderPlotly({
            plot_ly(data, labels = ~data[,"Cars"], values = ~data[,CurrentCategory], type = 'pie',
                    textposition = 'inside',
                    textinfo = 'label+percent',
                    insidetextfont = list(color = '#FFFFFF'),
                    hoverinfo = 'text',
                    width = sizeOut,
                    height = sizeOut,
                    showlegend = FALSE) %>%
                layout(title = paste("Ratios between the different cars based on",CurrentCategory),
                       xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
                       yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
        })
    })
})
