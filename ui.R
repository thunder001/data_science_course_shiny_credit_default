
shinyUI(pageWithSidebar(
  
  headerPanel("Predict your default rate"),
  sidebarPanel(
    numericInput("id1", "Please enter your income", 0, min=0, max=200000, step=5000),
    numericInput("id2", "Please enter your balance", 0, min=0, max=100000, step=200),
    selectInput("id3", "Are you a student?", c(" ","Yes", "No")),
    actionButton("goButton", "Submit")
  ),
  mainPanel(
    h3("Result of prediction"),
    h4("You entered"),
    verbatimTextOutput("income"),
    verbatimTextOutput("balance"),
    verbatimTextOutput("stu_status"),
    h4("Your default probability"),
    verbatimTextOutput("prediction")
    )
)
  
)
  
  
 