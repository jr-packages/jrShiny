## ----echo=FALSE, message=FALSE, fig.height=4, fig.width=4----------------
library(jrShiny)
layout(matrix(c(1, 1, 1, 0, 2, 0), 2, 3, byrow = TRUE), heights=c(8, 4))
layout_show(2, text=c("Plot", "Drop down"))  

## ----echo=FALSE, message=FALSE, fig.height=4, fig.width=4----------------
library("jrShiny")
layout(matrix(c(0, 1, 1, 1, 1, 1,0,
                0, 0, 2, 2, 2, 0, 0), 2, 7, byrow = T), heights=c(8, 4))
layout_show(2, text=c("Plot", "Drop down"))  

