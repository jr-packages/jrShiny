## ---- eval = FALSE------------------------------------------------------------
#  data(movies_new, package = "jrShiny")

## ---- eval = FALSE------------------------------------------------------------
#  function(input, output) {
#
#  }

## ---- eval = FALSE------------------------------------------------------------
#  data(movies_new, package = "jrShiny")

## ---- eval = FALSE------------------------------------------------------------
#  movies_new[movies_new$classification == input$id_of_widget, ]

## ---- eval = FALSE------------------------------------------------------------
#  movies_new[movies_new$rating >= input$id_of_widget, ]

## ---- eval = FALSE------------------------------------------------------------
#  movies_new[movies_new$duration <= input$id_of_widget, ]

## ---- eval = FALSE------------------------------------------------------------
#  movies_new[movies_new$year > input$id_of_widget[1] & movies_new$year < input$id_of_widget[2]]
