## ----echo=FALSE, message=FALSE-------------------------------------------
library("nclRshiny")
library("flexdashboard")

## ----echo=FALSE, fig.height=2, fig.width=2-------------------------------
layout(matrix(c(1:4), 4, 1, byrow = TRUE))
layout_show(4,2)

## ----echo=FALSE, fig.height=2, fig.width=2-------------------------------
layout(matrix(c(1:4), 2, 2, byrow = TRUE))
layout_show(4,1)

## ----echo=FALSE, fig.height=2, fig.width=2-------------------------------
layout(matrix(c(1:2, 3, 3, 4:5), 3, 2, byrow = TRUE))
layout_show(5,1)

## ----echo=FALSE, fig.height=2, fig.width=2-------------------------------
layout(matrix(c(1, 1, 2, 3:5), 2, 3, byrow = TRUE))
layout_show(5,1)

## ----echo=FALSE, fig.height=2, fig.width=2-------------------------------
layout(matrix(c(1, 1, 2,1, 1, 2, 3:5), 3, 3, byrow = TRUE))
layout_show(5,1)

## ----echo=FALSE, fig.height=2, fig.width=2-------------------------------
layout(matrix(c(1, 1, 2, 4, 
                1, 1, 2, 5, 
                1, 1, 3, 6,
                1, 1, 3, 7), 4, 4, byrow = TRUE))
layout_show(7,1)

## ----eval=FALSE----------------------------------------------------------
#  vignette("components", package="nclRshiny")

