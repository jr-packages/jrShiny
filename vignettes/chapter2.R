## ----echo=FALSE, message=FALSE-------------------------------------------
library("jrShiny")
library("shiny")

## ----eval=FALSE----------------------------------------------------------
#  ## Arguments: id, code to execute on the server
#  observeEvent(input$n, {print(input$n)})

## ----eval=FALSE----------------------------------------------------------
#  ## input$mean comes from a second slider
#  rnorm(input$n, input$mean)

