library("shiny")
library("jrShiny")
library("ggplot2")
library("dplyr")
fluidPage(
  titlePanel("I love flowers"), #title
  sidebarLayout(
    sidebarPanel(
      selectInput("flower_choice", "Choose your flower",
                  choices = unique(iris$Species))
      ),
    mainPanel(plotOutput("iris_plot"))
  )
)
