#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
        model1 <- lm(Wind~Temp, data = airquality)
        model2 <- lm(Wind ~ Ozone, data = airquality)
        model3 <- lm(Wind ~ Solar.R, data = airquality)
        
        model1pred<- reactive({
                TempInput <- input$sliderTemp
                predict(model1, newdata=data.frame(Temp = TempInput))
        })
        
        model2pred<- reactive({OzoneInput <- input$sliderOzone
                predict(model2, data.frame(Ozone = OzoneInput))})
        
        model3pred<- reactive({SolarInput <- input$sliderSolar
                predict(model3, data.frame(Solar.R = SolarInput))})
        
        output$plot1 <- renderPlot({
                inputTemp<- input$sliderTemp
                plot(airquality$Temp, airquality$Wind, 
                     xlab = "Temperature", ylab="Wind", 
                     bty = "n", pch = 16, ylim = c(1,21),
                     xlim = c(56,97))
                abline(model1, col = "red", lwd = 2)
        })
        #output$abline <- renderPlot({abline(model1, col = "red", lwd = 2)})
        output$plot2 <- renderPlot({inputTemp<- input$sliderOzone 
                plot(airquality$Ozone, airquality$Wind, 
                xlab = "Temperature", ylab="Ozone", bty = "n", pch = 16, ylim = c(1,21), xlim = c(1,168))
                abline(model2, col = "blue", lwd = 2)
                })

        output$plot3 <- renderPlot({inputTemp<- input$sliderSolar 
                plot(airquality$Wind, airquality$Solar.R, ylab = "Temperature", xlab="Solar.R", 
                bty = "n", pch = 16, xlim = c(1,21), ylim = c(7,334))
                abline(model3, col = "green", lwd = 2)
                })
        
        
        output$pred1 <- renderText({model1pred()})
        output$pred2 <- renderText({model2pred()})
        output$pred3 <- renderText({model3pred()})
})






