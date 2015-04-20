#setwd("/Users/sukiesun/Desktop/Coursera/Capstone_project/MyApp")
library(shiny)
library(stylo)
library(tm)
library(stringr)
library(stringi)
source("functions.R")
load("tb4.RData")



shinyServer(function(input, output) {
        
        
        output$value <- renderPrint({ input$text })
        pt <- reactive({
                text <- input$text
                ipt <- clean_ipt(text)
                n <- length(ipt)
                pt <- predict_nex_word(n,ipt)})
        
        output$prediction <- renderPrint(pt())
})