## Typically:
## the ui part would be save in ui.R
## the server section in server.R
## The app would be run using runApp()

library("shiny")
library("jrShiny")
library("ggplot2")
data(movies, package = "jrShiny")
ui = fluidPage(
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

server = function(input, output) {
  output$scatter = renderPlot({
    an = movies[movies[input$movie_type] == 1, ]
    ggplot(an, aes(x = rating, y = length)) + 
      geom_point(colour = "steelblue") + 
      labs(x = "Rating", 
           y = "Length", 
           title = paste0(input$movie_type, " movies"))
  })
}

runApp(list(ui = ui, server = server))
