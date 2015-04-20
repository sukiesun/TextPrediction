library(shiny)
library(markdown)

#setwd("/Users/sukiesun/Desktop/Coursera/Capstone_project/MyApp")
shinyUI(navbarPage("SwiftKey Capstone Project",
                   
                   tabPanel("My Smart Keyboard",
                            sidebarLayout(
                                    sidebarPanel(
                                            textInput("text", label = h3("Text input"), value = "Enter your text here...")
                                            
                                            #submitButton('Submit')
                                    ),
                                    
                                    mainPanel(
                                            h4('What you entered:'),
                                            verbatimTextOutput("value"),
                                            h4('Next word prediction:'),
                                            verbatimTextOutput("prediction")
                                    )
                            )),
                   
                   tabPanel("About", includeMarkdown("about.Rmd"))
))


