library(shiny)
shinyServer(
  function(input, output){
    output$creditHrs <- renderText({ calculatecreditHrs(input$req) })
    output$totAmt <- renderText({calculatetotAmt(input$req, input$dep, input$tenure, input$living, input$dept)})
    output$finalAmt <- renderText({calculatefinalAmt(input$schol, input$part, input$work, input$intern, input$tenure)})
    output$CalAmt <- renderText({calculateCalAmt(input$req, input$dep, input$tenure, input$living, input$dept, input$schol, input$part, input$work, input$intern)})
    output$Per <- renderText({calculatePer(input$req, input$dep, input$tenure, input$living, input$dept)})
  }
)

calculatecreditHrs <- function (req)
{
  result <- (req*4)+32
  return(round(result, digits = 2))
}

calculatetotAmt <- function(req, dep, tenure, living, dept)
{
  Tresult <-  (req*1500)+(dep*tenure*250)+(tenure*living)
  if(dept==1 | dept==2){
    fresult <- (Tresult+48300)*70
  }

  else if(dept==3){
    fresult <- (Tresult+84000)*70
  }
  else {
    fresult <- (Tresult+54000)*70
  }
  return(round(fresult, digits = 2))
}

calculatefinalAmt <- function(schol, part, work, intern, tenure)
{
  if(schol==TRUE){
    cschol <- 9000
  }
  else{
    cschol <- 0
  }
  if(part == TRUE){
    cpart <- 3600
  }
  else{
    cpart <- 0
  }
  if(work == TRUE){
    cwork <- 200
  }
  else{
    cwork <- 0
  }
  if(intern == TRUE){
    cintern <- 9000
  }
  else{
    cintern <- 0
  }
  if(tenure==18 | tenure==24){
    wten <- tenure - 12
  }
  else{
    wten <- 1
  }
  Dresult <- cintern + cpart + (cwork*wten) + cschol
  ffresult <- Dresult * 70
  return(round(ffresult, digits = 2))
}

calculateCalAmt <- function(req, dep, tenure, living, dept, schol, part, work, intern)
{
  Tresult <-  (req*1500)+(dep*tenure*250)+(tenure*living)
  if(dept==1 | dept==2){
    fresult <- (Tresult+48300)*70
  }

  else if(dept==3){
    fresult <- (Tresult+84000)*70
  }
  else {
    fresult <- (Tresult+54000)*70
  }
  if(schol==TRUE){
    cschol <- 9000
  }
  else{
    cschol <- 0
  }
  if(part == TRUE){
    cpart <- 3600
  }
  else{
    cpart <- 0
  }
  if(work == TRUE){
    cwork <- 200
  }
  else{
    cwork <- 0
  }
  if(intern == TRUE){
    cintern <- 9000
  }
  else{
    cintern <- 0
  }
  if(tenure==18 | tenure==24){
    wten <- tenure - 12
  }
  else{
    wten <- 1
  }
  Dresult <- cintern + cpart + (cwork*wten) + cschol
  ffresult <- Dresult * 70
  finale <- fresult-ffresult
  return(finale)
}

calculatePer <- function(req, dep, tenure, living, dept)
{
  Tresult <-  (req*1500)+(dep*tenure*250)+(tenure*living)
  OnlyReq <- req*1500
  if(dept==1 | dept==2){
    fresult <- (Tresult+48300)*70
    OnlyReqs <-(OnlyReq+48300)*70
  }
  else if(dept==3){
    fresult <- (Tresult+84000)*70
    OnlyReqs <-(OnlyReq+84000)*70
  }
  else {
    fresult <- (Tresult+54000)*70
    OnlyReqs <-(OnlyReq+54000)*70
  }
  Presult <- (OnlyReqs/fresult) * 100
  return(round(Presult, digits = 2))
}
