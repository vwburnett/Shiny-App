---
title       : Predicting Species of the iris dataset
subtitle    : ProjectApp
author      : Van Wyk Burnett
job         : 13.04.2020
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## App Overview

The ProjectApp is an app created with shiny and deployed on the shiny server.
Please access the app with this link: https://vwburnett.shinyapps.io/projectapp/

The ProjectApp make use of the iris dataset to train a randomForest prediction model. This model is then used to predict the Species that the selected Sepal.Lenth, Sepal Width, Petal.Lent and Petal.Width will produce.

The code for this app can be accessed in the following GitHub repo: https://github.com/vwburnett/Shiny-App/tree/master/ProjectApp. In this repo you will find the server.R and the ui.R documents that together produce the app.


--- .class #id 

## Overview of ui.R
The ProjectApp use the following code in the ui.R file:

```r
library(shiny)
shinyUI(fluidPage(
    titlePanel("Predict Species from the below"),
    sidebarLayout(
        sidebarPanel(
            sliderInput("sliderSL", "What is the Sepal Length?", 4, 8, value = 5.1),
            sliderInput("sliderSW", "What is the Sepal Width?", 2, 5, value = 3.5),
            sliderInput("sliderPL", "What is the Petal Length?", 1, 7, value = 1.4),
            sliderInput("sliderPW", "What is the Petal Width?", 0.1, 3, value = 0.2),
            submitButton("Submit")
        ),
        mainPanel(
            h3("Predicted Species"),
            textOutput("answer"),
            ))))
```

---

## Overview if server.R
The ProjectApp use the following code in the server.R file:

```r
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
    })})
```

---

## Dataset
The Project app make use of the iris dataset. This data set include Sepal Length, Sepal Width, Petal Length and Petal Width as measurements taken of a flower and for each set of measurements the Species is defined.

There are tree species:

```r
unique(iris$Species)
```

```
## [1] setosa     versicolor virginica 
## Levels: setosa versicolor virginica
```
In the ProjectApp a user can use the sliders to specify their measurements of Sepal Length, Sepal Width, Petal Length and Petal Width and the ProjectApp will predict the Species that the given measurements will produce.
