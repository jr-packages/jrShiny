function(input, output) {
  output$scatter = renderPlot({
    an = movies[movies[input$movie_type] == 1, ]
    ggplot(an, aes(x = length)) +
      geom_histogram(fill = "steelblue") +
      labs(y = "Count",
           x = "Length",
           title = paste0(input$movie_type, " movies"))
  })
}
