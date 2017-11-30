## ----message=FALSE, echo=FALSE-------------------------------------------
library("ggiraph")
gg_th <- theme(axis.ticks = element_line(colour = "gray90"), 
    panel.grid.major = element_line(colour = "gray90"), 
    panel.grid.minor = element_line(colour = "transparent"), 
    panel.background = element_rect(fill = "transparent"))


## ----eval=FALSE----------------------------------------------------------
#  install.packages("ggiraph")

## ----echo=FALSE----------------------------------------------------------
data(USArrests, package="datasets")
crimes <- data.frame(state = tolower(rownames(USArrests)), USArrests)
crimes$onclick <- sprintf(
  "window.open(\"%s%s\")",
  "http://en.wikipedia.org/wiki/",
  as.character(crimes$state)
)

gg_point_3 <- ggplot(crimes, aes(x = Murder, y = Assault, size = UrbanPop, colour = Rape )) + 
  geom_point_interactive(
    aes( data_id = state, tooltip = state, onclick = onclick ) ) + 
  scale_colour_gradient(low = "#999999", high = "#FF3333") + gg_th

ggiraph(code = print(gg_point_3), 
        hover_css = "fill-opacity:.3;cursor:pointer;")

