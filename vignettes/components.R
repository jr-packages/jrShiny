## ----setup, include=FALSE------------------------------------------------
library(flexdashboard)
library(jrShiny)
library("ggplot2movies")
library(ggplot2)
library(flexdashboard)
data(movies, package="ggplot2movies")
movies = movies[!is.na(movies$budget) & movies$budget > 0,]
top_movies = movies[order(-movies$rating), c("title", "year", "budget", "rating"), ]
colnames(top_movies)  = c("Title", "Year", "Budget", "Rating")
an = movies[movies$Animation==1,]

theme_set(theme_bw())

## ------------------------------------------------------------------------
knitr::kable(top_movies[1:10,], row.names = FALSE)

## ------------------------------------------------------------------------
DT::datatable(top_movies, rownames = FALSE)

## ------------------------------------------------------------------------
setnicepar()
plot(an$rating, an$length, ylab="Length", xlab="Rating", 
      pch=21, bg="steelblue", ylim=c(0, 140), xlim=c(1, 10))
grid()

## ------------------------------------------------------------------------
setnicepar()
hist(an$length, breaks="fd", col="steelblue", xlab="Movie Length", 
     main="Histogram of movie length")

## ------------------------------------------------------------------------
library(plotly)
g = ggplot(movies, aes(length, rating)) + 
  geom_point(size=0.5, aes(text=paste("Film: ", title))) + 
  xlab("Length") + ylab("Rating") + 
  ylim(c(1, 10)) 
ggplotly(g)

## ------------------------------------------------------------------------
valueBox(sum(movies$rating <2), icon = "ion-videocamera", caption="Movies Rated less than 2", 
         color="red")

## ------------------------------------------------------------------------
library(dygraphs)
years = movies[movies$year > 1929,]
rat_by_year = tapply(years$rating, years$year, mean)

x = ts(as.vector(rat_by_year), start=1930)
y = cbind(Rating=x)
dygraph(y, main = "Ratings over the years", 
        ylab = "Ratings", group="Ratings") %>% 
  dyRangeSelector() %>%
   dyOptions(stepPlot = TRUE) %>%
  dySeries("V1", label = "Rating")

## ------------------------------------------------------------------------
library(dygraphs)
years = movies[movies$year > 1929,]
num_by_year = tapply(years$rating, years$year, sum)
x = ts(as.vector(num_by_year), start=1930)
y = cbind(Rating=x)
dygraph(y, main = "Number of movies over the years", 
        ylab = "No. of movies",group="Ratings") %>% 
  dyRangeSelector() %>%
   dyOptions(stepPlot = TRUE) %>%
  dySeries("V1", label = "No. of Movies made")


