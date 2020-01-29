library("shiny")
library("jrShiny")
library("ggplot2")
data(movies, package = "jrShiny")
fluidPage(
  titlePanel("I love movies"), #title
  ## Sidebar with a slider input for no. of points
  sidebarLayout(
    sidebarPanel(
      selectInput("movie_type", label = "Movie genre", c("Romance", "Action", "Animation"))
    ),
    ## Show a plot of the generated distribution
    mainPanel(plotOutput("scatter"))
  )
)
