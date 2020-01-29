library("shiny")
library("jrShiny")
library("ggplot2")
library("tibble")
## Basic layout. Two regions.
ui = basicPage(
  plotOutput("scatter", click = "plot_click"),
  textOutput("coords")
)

## Simulate data
x = signif(rnorm(10), 3); y = signif(rnorm(10), 3);
server = function(input, output) {
  ## Scatter plot
  output$scatter = renderPlot({
    dat = tibble(x = x, y = y)
    ggplot(dat, aes(x = x, y = y)) +
      geom_point()
  })

  output$coords = renderText({
    x = signif(input$plot_click$x, 4)
    y = signif(input$plot_click$y, 4)
    paste0("x: ", x, "   | y: ", y)
  })

}
runApp(list(ui = ui, server = server))
