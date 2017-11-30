## ----message=FALSE, echo=FALSE-------------------------------------------
library("edgebundleR")

## ---- eval=FALSE---------------------------------------------------------
#  install.packages("edgebundleR")

## ---- echo=FALSE, message=FALSE------------------------------------------
library(edgebundleR)
library(MASS)
data(mtcars, package="datasets")
sig = kronecker(diag(3),matrix(2,5,5)) + 3*diag(15)
X = MASS::mvrnorm(n=100,mu=rep(0,15),Sigma = sig)
colnames(X) = paste(rep(c("A.A","B.B","C.C"),each=5),1:5,sep="")
edgebundle(cor(X),cutoff=0.2,tension=0.8,fontsize = 14)

## ---- message=FALSE------------------------------------------------------
cor_mt = cor(mtcars)
cor_mt[cor_mt < 0.7 & cor_mt > -0.7] = 0

## ------------------------------------------------------------------------
edgebundle(cor_mt)

