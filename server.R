
library(shiny)
library(ISLR)
library(caret)
data(Default)
set.seed(1345)
intrain <- createDataPartition(Default$default, p=0.75, list=FALSE)
training <- Default[intrain,]
testing <- Default[-intrain,]
#dim(testing)
fit.glm <- glm(default~., data=training, family=binomial)
glm.pred <- predict(fit.glm, testing)
pred1 <- rep("No",2499)
pred1[glm.pred>0.2] <- "Yes"
#table(pred1, testing$default)

myfunction <- function(income, balance,stud_status) {
  dat <- data.frame(income=income, balance=balance, student=stud_status)
  glm.prob2 <- predict(fit.glm, dat, type="response") * 100
  paste(as.character(round(glm.prob2,2)),"%", sep="")
}
shinyServer(
  function(input, output) {
    output$income <- renderPrint({input$goButton; isolate(input$id1)})
    output$balance <- renderPrint({input$goButton; isolate(input$id2)})
    output$stu_status <- renderPrint({input$goButton; isolate(input$id3)})
    output$prediction <- renderPrint({
      if (input$goButton==0) {
        "You haven't enter your information"
      }
      else isolate(myfunction(input$id1,input$id2,input$id3))})
    }
)