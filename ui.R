library(shiny)
shinyUI(pageWithSidebar(
        headerPanel("Titanic Survival Prediction"),
        sidebarPanel(
                radioButtons("i_Pclass","Passenger Class:",
                             c("1st Class"=1,"2nd Class"=2,"3rd Class"=3)),
                radioButtons("i_Sex","Passenger Sex:",
                             c("Male"="male","Female"="female")),
                numericInput('i_Age', 'Age:', 30, min = 1, max = 80, step = 1),
                radioButtons("i_family","Has family onboard",
                             c("Yes"=1,"No"=0)),
                submitButton("Submit")
        ),
        mainPanel(
               h1("Passenger Survival Prediction"),
               p("The prediction of this passenger would be:"),
               verbatimTextOutput("o_prediction"),
               hr(),
               h2("Background History"),
               p("The sinking of the Titanic was one of the worst 
                 passenger ship accidents of moderm history.
                 The sinking killed 1502 out of 2224 passengers and crew. One of the
                 reasons that led to such a loss of people's life was that there were
                 not enough lifeboats on board. Also, some people relate that passengers
                 in first class had priority to access the lifeboats over passengers in 
                 the third class."),
               h3("How to Use this App"),
               p("This App was built with a Machine Learning Algorithm that was trained with
                 a real dataset of passenger survival conditions. The dataset was downloaded from 
                 https://www.kaggle.com/c/titanic/data"),
               p("You as the user can modify the input variables Passenger Class, Passenger Sex,
                 Passenger Age and if the Passenger had family onboard."),
               p("If you saw the movie Titacnic, or any other documentary about the sinking,
                 you might remember that factors like if the passenger was on first class or third
                 class, if the passenger were a woman or a man and other factors, had an impact
                 in the passengers survival chances. For example if you were a young woman traveling
                 on first class you were likely to survive; after all, you know how the say goes, 
                 women and children first!"),
               p("So, go ahead and play around modifiying the variables and after you click on the
                 submit buttom you will see what the survival prediction for that passenger was.")
               
        )
))