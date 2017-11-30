## ----eval=TRUE, results="hide", cache=FALSE, message=FALSE---------------
library("shiny")
fluidPage(
  titlePanel("Shiny happy people"), #title
  ## Sidebar with a slider input for no. of points
  sidebarLayout( 
    sidebarPanel(
      sliderInput("n", "Number of points:", min = 1, 
                                  max = 50, value = 30)
    ),
    ## Show a plot of the generated distribution
    mainPanel(plotOutput("scatter"))
  )
)

## ----echo=FALSE, message=FALSE-------------------------------------------
library(nclRshiny)
layout(matrix(1:2, 1), width=c(1, 3))
layout_show(2, text=c("Side bar", "Chart"), cex=1.5)
text(0.1, 1, "Shiny Happy people")

## ----eval = TRUE, results="hide", message=FALSE--------------------------
library("shiny")
# Function always has input & output
function(input, output) {
  # Expression that generates a plot. 
  # A call to renderPlot indicates that:
  #  1) It is "reactive" and therefore should 
  #   re-execute automatically when inputs change
  #  2) Its output type is a plot
  output$scatter = renderPlot({plot(rnorm(input$n))})
}

## ----eval=FALSE----------------------------------------------------------
#  vignette("chapter5", package="nclRshiny")

## ----eval=FALSE----------------------------------------------------------
#  library("shiny")
#  runApp("my_app")

## ----results="hide"------------------------------------------------------
em("Some text")

## ----results="hide", cache=FALSE-----------------------------------------
fluidPage(
  titlePanel("Title panel"),# Title
  ## Sidebar style
  sidebarLayout(
    sidebarPanel("The sidebar"),
    mainPanel("Main panel")
  )
)

## ----results="hide", cache=FALSE-----------------------------------------
sidebarLayout(position="right",
  sidebarPanel("The sidebar"),
  mainPanel("Main panel")
)

## ----results="hide"------------------------------------------------------
sidebarLayout(
  sidebarPanel("The sidebar", p("Choose an option")),
  mainPanel("Main panel")
)

## ----results="hide", cache=TRUE------------------------------------------
ui = fluidPage(
  titlePanel("I love movies"), #Title
  fluidRow( # Define a row
    column(4, # Two columns: width 4 & 8
    wellPanel(
      selectInput("movie_type", label = "Movie genre", 
          c("Romance", "Action", "Animation"))
      )       
    ),
  column(8, plotOutput("scatter"))
  )
)

## ----eval = FALSE--------------------------------------------------------
#  mainPanel(
#    tabsetPanel(type = "tabs",
#                tabPanel("Plot", plotOutput("plot")),
#                tabPanel("Summary", verbatimTextOutput("summary")),
#                tabPanel("Table", tableOutput("table"))
#    )
#  )

## ---- eval = FALSE-------------------------------------------------------
#  vignette("chapter5",package = "nclRshiny")

## ----results="hide"------------------------------------------------------
library("shiny")
## Basic layout. Two regions.
ui = basicPage(
  plotOutput("scatter", click = "plot_click"),
  verbatimTextOutput("info")
)

## ----cache=TRUE----------------------------------------------------------
## Simulate data
x = signif(rnorm(10), 3); y = signif(rnorm(10), 3);
server = function(input, output) {
  output$scatter = renderPlot(plot(x, y))
  output$info = renderText({
    paste0("x=", input$plot_click$x, "\ny=", input$plot_click$y)
  })
}

## ---- eval = FALSE-------------------------------------------------------
#  server = function(input,output,session){}

## ------------------------------------------------------------------------
server = function(input,output,session)
data = reactive({
  invalidateLater(1000)
  runif(10)
})

## ----echo=FALSE----------------------------------------------------------
knitr::include_graphics("graphics/email.jpg")

## ----eval=FALSE----------------------------------------------------------
#  library("rsconnect")
#  deployApp("name_of_app.Rmd")

