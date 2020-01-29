library(shiny)
library(jrShiny)
library(shinydashboard)
library(DT)
data(movies, package = "jrShiny")

# note that this is not a fluidPage
ui = dashboardPage(
  dashboardHeader(title = "Shiny Dashboard"),
  dashboardSidebar(
    radioButtons("movie_type",
                 label = "Movie genre", c("Romance", "Action")),
    sidebarMenu(
      menuItem("Plot", tabName = "plot_page"),
      menuItem("More!",
               menuSubItem("Summary", tabName = "summary_page"),
               menuSubItem("Table", tabName = "table_page"))
    )
  ),
  dashboardBody(
    tabItems(
      tabItem("plot_page", plotOutput("scatter")),
      tabItem("summary_page", verbatimTextOutput("summary")),
      tabItem("table_page", dataTableOutput("table"))
    )
  )
)

server = function(input, output) {
  dat = reactive({
    movies[movies[input$movie_type] == 1, ]
  })
  output$scatter = renderPlot({
    an = dat()
    plot(an$rating, an$length, ylab = "Length", xlab = "Rating",
         pch = 21, bg = "steelblue", ylim = c(0, max(an$length)),
         xlim = c(1, 10), main = paste0(input$movie_type, " movies"))
  })
  output$summary = renderPrint(summary(dat()[, c("length", "rating")]))
  output$table = renderDataTable({
    datatable(dat()[, c("length", "rating")])
  })
}

runApp(list(ui = ui, server = server))
