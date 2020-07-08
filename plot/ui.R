#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application 
shinyUI(fluidPage(

    # Application title
    titlePanel("Predict the Wind from the other variables"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
                #checkboxInput("showTemp", "Show/Hide Temp Linear Regression", value = TRUE),
                #checkboxInput("showOzone", "Show/Hide Ozone Linear Regression", value = FALSE),
                #checkboxInput("showSolar", "Show/Hide Solar Linear Regression", value = FALSE),
                sliderInput("sliderTemp",
                            "What is the temperature",
                            min = 56, max = 97, value = 70),
                sliderInput("sliderOzone", "What is the ozone", min = 0, max = 168, value = 100),
                sliderInput("sliderSolar","What is the solar.r", min = 7, max = 334, value = 200)
            
        ),

        # Show a plot of the generated distribution
        mainPanel(#plotOutput("plot1"), h3("Predicted Wind from the Model:"), textOutput("pred1"))
                  #h3("Predicted Wind from the Model:"),textOutput("pred1"))
                tabsetPanel(type = "tabs",
                            tabPanel("Temperature", br(), plotOutput("plot1"), 
                                     h3("Predicted Wind from the Model:"), textOutput("pred1")),
                            tabPanel("Ozone", br(), plotOutput("plot2"), 
                                     h3("Predicted Wind from the Model:"), textOutput("pred2")),
                            tabPanel("Solar.R", br(), plotOutput("plot3"), 
                                     h3("Predicted Wind from the Model:"), textOutput("pred3"))
                            
           # tabPanel("Solar.R", br(), plotOutput("plotSolar"),
                      #h3("Predicted Wind from the Model:"),textOutput("pred3"))
                )
        )
    )
))




