## ----eval=FALSE----------------------------------------------------------
#  install.packages("svgPanZoom")
#  install.packages("svglite") # Needed for base

## ----eval=FALSE----------------------------------------------------------
#  devtools::install_github("timelyportfolio/svgPanZoom")

## ----message=FALSE-------------------------------------------------------
library("svgPanZoom") 
library("svglite")## For base

## ---- message=FALSE------------------------------------------------------
svgPanZoom(
  svglite:::inlineSVG(
    plot(1:10)
  ),controlIconsEnabled=TRUE
)

## ---- message=FALSE------------------------------------------------------
library("ggplot2")
data(mtcars, package="datasets")
#install.packages("gridSVG")
d = ggplot(mtcars, aes(mpg, disp, colour=disp)) + geom_jitter() + 
  theme_bw()
svgPanZoom(d, controlIconsEnabled = TRUE)

