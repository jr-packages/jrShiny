library("DT")
function(input, output) {
    data("movies_new", package = "jrShiny")
    rvs = reactiveValues(data = movies_new)
    observe({
        movies_filtered = movies_new[movies_new$classification %in% input$classification, ]
        movies_filtered = movies_filtered[movies_filtered$rating >= input$rating, ]
        movies_filtered = movies_filtered[movies_filtered$duration <= input$duration, ]
        movies_filtered = movies_filtered[movies_filtered$year > input$year[1] &
                                              movies_filtered$year < input$year[2], ]
        print(input$year)
        rvs$data = movies_filtered
    })
    output$movies_table = renderDataTable({
        movies_filtered = rvs$data[, c("title",
                                       "year",
                                       "duration",
                                       "classification",
                                       "rating")]
        datatable(movies_filtered)
    })
}
