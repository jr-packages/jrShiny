## ----eval=FALSE----------------------------------------------------------
#  install.packages("networkD3")

## ----message=FALSE-------------------------------------------------------
library(networkD3)
networkData = data.frame(src=c("A", "A", "A", "A", "B", "B", "C", "C", "D"), 
                          target=c("B", "C", "D", "J", "E", "F", "G", "H", "I"))
simpleNetwork(networkData)

## ----echo=FALSE----------------------------------------------------------
data(MisLinks, package="networkD3")
data(MisNodes, package="networkD3")

# Plot
forceNetwork(Links = MisLinks, Nodes = MisNodes,
            Source = "source", Target = "target",
            Value = "value", NodeID = "name",
            Group = "group", opacity = 0.8)

## ----echo=FALSE----------------------------------------------------------
data(Energy, package="nclRshiny")
# Plot
sankeyNetwork(Links = Energy$links, Nodes = Energy$nodes, Source = "source",
             Target = "target", Value = "value", NodeID = "name",
             units = "TWh", fontSize = 12, nodeWidth = 30)

