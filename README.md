##Developing-Data-Products-Coursera Assignment

###Expenses at University of Illinois at Chicago - UIC
This application is exclusively designed for Indian students with an admit at UIC. This application is intended to provide an interactive expense calculator for students at UIC during their entire course tenure. 

Each and every parameter is interlinked to the expense and savings. For example : If the period of stay is longer, then living expense shoots up high but parallely if we work then we would end up saving a ransom amount.

```{r}
library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Expenses at University of Illinois at Chicago - UIC"),
  sidebarPanel(
    radioButtons("dept", "Select your intended course of study",
                  c("Management Information Systems"=1,
                    "Other MBA courses"=3,
                    "Other MS courses"=4,
                    "Business Analytics"=2)),
    numericInput("req", "Number of Pre-Requisites?", 3, min=3, max=7, step=1),
    numericInput("dep", "Number of dependants?", 0, min=0, max=2, step=1),
    numericInput("tenure", "Intended Course Plan - tenure in months?", 18, min=12, max=24, step=6),
    numericInput("living", "Estimated monthly living expense in USD? (including monthly house rent)", 650, min=500, max=800, step=10),
    h4('Check the case scenarios which matches your case :'),
    checkboxInput("schol", "Have secured a scholarship", value=FALSE, width=NULL),
    checkboxInput("intern", "Hold an internship offer", value=FALSE, width=NULL),
    checkboxInput("part", "Work Part-time - GA", value=FALSE, width=NULL),
    checkboxInput("work", "Would Continue to work online - freelance", value=FALSE, width=NULL)
                       # c("Secure an intern during summer"=9000,
                       #   "Manage to get a GA or part-time "=540,
                       #   "Continue working online"=250,
                       #   "Scholarship Available"="Y"))
    ),
  mainPanel(
    #numericInput("living", "Estimated monthly living expense in USD? (including monthly house rent)",
    h4('Total number of credit hours you need to complete is'),
    textOutput("creditHrs"),
    h4('Total amount you might have to spend'),
    textOutput("totAmt"),
    h4('But you can Save upto this amount on parallel lines'),
    textOutput("finalAmt"),
    h4('Then Final Total Expenditure after deducting the savings is'),
    textOutput("CalAmt"),
    h4('Percentage of amount you actually invest in education is'),
    textOutput("Per"),
    br(),
    h4('Instructions'),
    helpText("This application is exclusively designed for Indian students with an admit at UIC. This application is intended to provide an interactive expense calculator for students at UIC during their entire course tenure. Each and every parameter is interlinked to the expense and savings. For example : If the period of stay is longer, then living expense shoots up high but parallely if we work then we would end up saving a ransom amount."),
    code("Credit Hours"),
    helpText("Number of pre-requisites varies across students from different UG background. Each pre-requisite corresponds to 4 credit hours and its calculated accordingly."),
    code("Expense and Savings"),
    helpText("The final amount is given in INR i.e. Indian Rupees and the conversion rate is taken at 1usd=70rs."),
    code("Percentage of Amount"),
    helpText("It is the amount spent on education (course fee, books, credits etc) expressed as percentage with respect to the entire expenditure. NOTE: It excludes living expenses and other expenses pertaining to dependants")

  )
  ))

```
