
library(shiny)

shinyUI(fluidPage(
    titlePanel("Predict Species from the below"),
    sidebarLayout(
        sidebarPanel(
            sliderInput("sliderSL", "What is the Sepal Length?", 4, 8, value = 5.1),  #input of sepal.length for prediction.
            sliderInput("sliderSW", "What is the Sepal Width?", 2, 5, value = 3.5), #input of sepal.width for prediction.
            sliderInput("sliderPL", "What is the Petal Length?", 1, 7, value = 1.4), #input of petal.length for prediction.
            sliderInput("sliderPW", "What is the Petal Width?", 0.1, 3, value = 0.2), #input of petal.width for prediction.
            submitButton("Submit")
            
        ),
        
        mainPanel(
            h3("Predicted Species"),
            textOutput("answer"),
            )
        )
    )
)

