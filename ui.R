library(shiny)
shinyUI(pageWithSidebar(
        headerPanel("Tictanic Survival Prediction"),
        sidebarPanel(
                radioButtons("i_Pclass","Passenger Class:",
                             c("1st Class"=1,"2nd Class"=2,"3rd Class"=3)),
                radioButtons("i_Sex","Passenger Class:",
                             c("Male"="male","Female"="female")),
                numericInput('i_Age', 'Age:', 30, min = 1, max = 80, step = 1),
                radioButtons("i_family","Has family onboard",
                             c("Yes"=1,"No"=0)),
                submitButton("Submit")
        ),
        mainPanel(
               h1("Passenger Survival Prediction"),
               p("The prediction of this passenger would be:"),
               verbatimTextOutput("o_prediction")
               
        )
))