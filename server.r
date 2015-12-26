library(shiny)

cars.lm <- lm(dist ~ speed, data = cars)
predStopDist <- function(InputSpeed){
    speed <- data.frame(speed = InputSpeed)
    cars.pred <- predict(cars.lm,speed)
    cars.pred
}
predStopDist.lowConf <- function(InputSpeed){
    speed <- data.frame(speed = InputSpeed)
    cars.pred <- predict(cars.lm,speed,se.fit=TRUE,level=0.95)
    as.numeric(cars.pred$fit - cars.pred$se.fit)
}
predStopDist.highConf <- function(InputSpeed){
    speed <- data.frame(speed = InputSpeed)
    cars.pred <- predict(cars.lm,speed,se.fit=TRUE,level=0.95)
    as.numeric(cars.pred$fit + cars.pred$se.fit)
}

shinyServer(
    function(input, output) {
        output$inputValue <- renderPrint({input$speed})
        output$prediction <- renderText({predStopDist(input$speed)})
        output$confMsg    <- renderPrint({
                                paste(predStopDist.lowConf(input$speed),
                                      "to",
                                      predStopDist.highConf(input$speed),
                                      sep=" ")})
    }
)

##library(shiny)
##setwd("/home/lamarr/R/DevelopingDataProducts")
##runApp()