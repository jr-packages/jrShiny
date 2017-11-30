## ----message=FALSE, echo=FALSE-------------------------------------------
library("d3heatmap")

## ---- eval=FALSE---------------------------------------------------------
#  install.packages("d3heatmap")

## ---- echo=FALSE, message=FALSE------------------------------------------
data(mtcars, package="datasets")
x = mtcars 
#d3heatmap(x, k_row = 4, k_col = 2)
d3heatmap(x, k_row = 4, k_col = 2, scale = "column") # a more appropriate scalling

## ---- echo=FALSE---------------------------------------------------------
d3heatmap(cor(x), k_row = 3, k_col = 3)

