library(shiny)
library(caret)
library(randomForest)
library(random)

shinyServer(function(input, output) {
    output$answer <- renderText({
        model1 <- randomForest(Species ~ ., data = iris)
        Sepal.Length <- input$sliderSL
        Sepal.Width <- input$sliderSW
        Petal.Length <- input$sliderPL
        Petal.Width <- input$sliderPW
        sliderdata <- data.frame(Sepal.Length, Sepal.Width, Petal.Length, Petal.Width)
        answer <- predict(model1, newdata = sliderdata)
        answer <- as.character(answer)   
    })
})