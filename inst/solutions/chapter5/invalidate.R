library(shiny)
library(jrShiny)
data(movies, package = "jrShiny")
ui = fluidPage(titlePanel("invalidate"),
               fluidRow(
                 column(4,
                        wellPanel(
                          numericInput("n",
                                       label = "Number of points",
                                       value = 5)
                        )
                 ),
                 column(8, plotOutput("scatter"))
               )
)

server = function(input, output, session) {

  dat = reactive({
    invalidateLater(5000, session)
    # the plot has a reactive dependency on both
    # n and the invalidation timer
    rows_to_sample = sample(1:nrow(movies), size = 50)
    movies[rows_to_sample,]
  })
  output$scatter = renderPlot({
    d = dat()
    plot(d$rating, d$length)
  })
}

runApp(list(ui = ui, server = server))
