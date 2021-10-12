#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(plotly)
library(shiny)
library(caret)


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    #Global Variables
    CurrentCategory <- colnames(iris)[1]
    data <- 0
    Partition <- 0
    Training <- 0
    Testing <- 0
    ratio <- 0.1
    
    trainC <- trainControl(method = "cv", number = 5, allowParallel = T)
    
    #Events
    observeEvent(input$Category, {
        CurrentCategory <<- input$Category
        data <<- data.frame("Species"=iris[,"Species"] ,"Cat"=iris[,CurrentCategory])
    })
    
    observeEvent(input$RatioTraining, {
        ratio <<- input$RatioTraining/100
        Partition <- createDataPartition(y = data$Species,p = ratio,list = FALSE)
        Training <<- data.frame( data[Partition,])
        Testing <<- data.frame(data[-Partition,])
    })
    
    observeEvent(input$Train, {
        
        modFit_lda <- train(Species~.,method = "lda" ,data = Training, trControl = trainC)
        
        predict_lda <- predict(modFit_lda,Testing)
        output$Results <- renderPrint({
            confusionMatrix(predict_lda, as.factor(Testing$Species))
        })        
        eqPred <- (predict_lda==Testing$Species)
        
        plotData<- data.frame("Prediction" = predict_lda, "Actuals" = Testing$Species)

        scatter <- ggplot(plotData, aes(x = Prediction, y = Actuals, color = eqPred)) + 
            geom_point() 
            geom_smooth(formula=y ~ x, method="lda", se=FALSE) 
        
        output$distPlot <- renderPlotly({
            ggplotly(p = scatter, type = 'scatter')
        })
    })
})
