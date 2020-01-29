function(input, output) {
  output$iris_plot = renderPlot({
    data = filter(iris, Species == input$flower_choice)
    ggplot(data, aes(x = Petal.Width,
                           y = Petal.Length)) +
      geom_point()
  })
}
