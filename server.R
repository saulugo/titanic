library(shiny)
library(rpart)

set.seed(1234)
train <- read.csv('train.csv')
train$Survived <- as.factor(train$Survived)
train$family <- ifelse(train$SibSp>0 | train$Parch>0,1,0)
train$family <- as.factor(train$family)
train$Pclass <- as.factor(train$Pclass)
mod <- rpart(Survived ~ Pclass + Sex + Age + family,data=train)
print(mod)


prediction <- function(i_Pclass,i_Sex,i_Age,i_family){
        x <- data.frame(Pclass=i_Pclass,Sex=i_Sex,Age=i_Age,family=i_family)
        x$Pclass <- as.factor(x$Pclass)
        x$family <- as.factor(x$family)
        res <- predict(mod,x)  
        if(res[1,1]>res[1,2]){
                res <- "Did not Survive"
        }else{
                res <- "Survived"
        }
        res
}

shinyServer(
        function(input, output) {
                output$o_prediction <- renderPrint({prediction(input$i_Pclass,input$i_Sex,
                                                               input$i_Age,input$i_family)})
                #output$o_prediction <- renderPrint({input$i_Pclass})
        }
)