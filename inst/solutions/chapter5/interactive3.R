library("shiny")
library("jrShiny")
library("dplyr")
## Basic layout. Two regions.
ui = basicPage(
  actionButton("reset", "Reset points"),
  plotOutput("scatter", click = "plot_click", brush = "plot_brush"),
  verbatimTextOutput("info")
)

## Simulate data
x = signif(rnorm(100), 3); y = signif(rnorm(100), 3);
dd = data.frame(x, y)
server = function(input, output) {

  rvs = reactiveValues(dat = dd)

  ## Scatter plot
  output$scatter = renderPlot({
    plot(rvs$dat$x, rvs$dat$y)
  })

  observeEvent(input$reset, {
    rvs$dat = dd
  })

  observeEvent(input$plot_click, {
    clicked = nearPoints(rvs$dat, input$plot_click,
                         xvar = "x", yvar = "y",
                         threshold = 100,
                         maxpoints = 1,
                         allRows = TRUE)
    # or for brushed points
    # brushed = brushedPoints(rvs$dat, input$plot_brush,
    #                         xvar = "x", yvar = "y",
    #                         allRows = TRUE)
    rvs$dat = filter(clicked,
                     selected_ == FALSE)
  })

  ## Text box
  # output$info = renderPrint(
    # nearPoints() also works with hover and dblclick events
    # nearPoints(rvs$dat, input$plot_click,
    #            xvar = "x", yvar = "y",
    #            threshold = 100,
    #            maxpoints = 1,
    #            allRows = TRUE)
    # threshold = 100: grab all points within 100 pixels
    # maxpoints = 2: grab the closest 2 points
    # allRows = TRUE: print the whole data set but add a selected columm
    # addDist = TRUE: adds a distance column to the output
#
#   )

}
runApp(list(ui = ui, server = server))
