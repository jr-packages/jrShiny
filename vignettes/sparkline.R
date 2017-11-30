## ----echo=FALSE----------------------------------------------------------
library("htmlwidgets")
library("sparkline")
set.seed(3)
x = signif(rnorm(10), 2)
y = signif(rnorm(10), 2)

## ----eval=FALSE----------------------------------------------------------
#  devtools::install_github("htmlwidgets/sparkline")

