---
title       : Course Project
subtitle    : Calculate the total body water
author      : Marlon Vinan
job         : UTPL
logo        : bloomberg_shield.png
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
url:
  lib: ./librariesNew
  assets: ./assets
widgets     : [mathjax]            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
#knit        : slidify::knit2slides
---

## Context Application

1. Shiny application was developed to calculate the total body water
2. Is related to the physiology topic
3. Total body water
4. BODY FLUID COMPARTMENTS

--- .class #id 

## Prediction Function
1. Using this calc:
 $$total-body-water = {0.6 * weight}$$
![markup](./assets/img/fbc.png 'Markup in ui.R')

---

## ui.R


--- 

```
library(shiny)
shinyUI(fluidPage(
  headerPanel("Total body water "),
  sidebarLayout(
    sidebarPanel(
      helpText("HOMEOSTASIS & BASIC MECHANISMS. Calculus of body fluid components.
               Total body water = ICF + ECF where ECF = IS + IVS"),
      
      numericInput('weight', 'Weight kg', 64, min = 0, max = 500, step = 1), 
      submitButton('Submit')
    ),
    mainPanel(
      h3('Results of prediction'),
      h4('You entered'),
      verbatimTextOutput("inputValue"), 
      h4('Total body water (L)'), 
      verbatimTextOutput("prediction")
    )
  )
))
```
--- 

---
## server.R

```
totalbodywater <- function(weight) weight * 0.6
shinyServer(function(input, output) {
  output$inputValue <- renderPrint({input$weight})
  output$prediction <- renderPrint({totalbodywater(input$weight)}) 
})

```
--- 


