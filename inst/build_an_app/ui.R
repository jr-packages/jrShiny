library("shinydashboard")
data(movies_new, package = "jrShiny")
max_duration = max(movies_new$duration)
min_year = min(movies_new$year)
max_year = max(movies_new$year)

dashboardPage(
    dashboardHeader(title = "Build an app!"),
    dashboardSidebar(sidebarMenu(
        menuItem("Movie controls", tabName = "controls"),
        menuItem("Selected Movies", tabName = "selected")
    )),
    dashboardBody(tabItems(
        tabItem("controls",
                fluidRow(
                    box(
                        selectInput(
                            "classification",
                            "Select movie Classification",
                            choices = c("12A", "PG", "U", "15", "18"),
                            multiple = TRUE
                        ),
                        width = 6,
                        status = "primary",
                        solidHeader = TRUE,
                        collapsible = TRUE
                    ),
                    box(
                        sliderInput(
                            "rating",
                            "Select minimum movie rating",
                            min = 0,
                            max = 10,
                            value = 0
                        ),
                        width = 6,
                        status = "primary",
                        solidHeader = TRUE,
                        collapsible = TRUE
                    )
                ),
                fluidRow(
                    box(
                        sliderInput(
                            "duration",
                            "Select a maximum film duration",
                            min = 1,
                            max = max_duration,
                            value = 90
                        ),
                        width = 6,
                        status = "primary",
                        solidHeader = TRUE,
                        collapsible = TRUE
                    ),
                    box(
                        sliderInput(
                            "year",
                            "Select a year range",
                            min = min_year,
                            max = max_year,
                            value = c(1950, 2000)
                        ),
                        width = 6,
                        status = "primary",
                        solidHeader = TRUE,
                        collapsible = TRUE
                    )
                )),
        tabItem("selected",
                fluidRow(box(
                    dataTableOutput("movies_table"),
                    width = 12
                )))
    ))
)
