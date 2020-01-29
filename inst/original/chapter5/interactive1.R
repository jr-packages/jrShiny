library("shiny")
library("jrShiny")

## Basic layout. Two regions.
ui = basicPage(
  plotOutput("scatter", click = "plot_click")
)

## Simulate data
x = signif(rnorm(10), 3); y = signif(rnorm(10), 3);
server = function(input, output) {
  ## Scatter plot
  output$scatter = renderPlot(plot(x, y))

}
runApp(list(ui = ui, server = server))
