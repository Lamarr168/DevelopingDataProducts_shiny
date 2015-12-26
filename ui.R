library(shiny)


shinyUI(
    pageWithSidebar(
    headerPanel("Car Stopping Distance Predictor"),
    
    sidebarPanel(
        h3('Enter a car speed in mph:'),
        numericInput('speed', 'Car Speed mph', 10, min = 5, max = 25, step = 1),
        submitButton('Submit')
    ),
    mainPanel(
        h3('Results of prediction'),
        h4('You entered:'),
        verbatimTextOutput("inputValue"),
        h4('Which resulted in a predicted stopping distance (in feet) of== '),
        verbatimTextOutput("prediction"),
        h4('The 95% confidence interval for the prediction:'),
        verbatimTextOutput("confMsg")
        
    )
))