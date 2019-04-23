### DATA SECTION

library(data.table)


## Read data with 'data.table::fread'
input <- fread("FlowMatrix.csv", select = 1:3)
setnames(input, 1:3, new = c("origin", "destination","total"))


## Coordinates
centroids <- fread("centroids.csv")
## 'Code' is the key to be used in the joins
setkey(centroids, Code)
## Key of centroids matches `origin` in `input`
origin <- centroids[input[,.(origin, total)]]
setnames(origin, c('East', 'North'), c('xstart', 'ystart'))
## Key of centroids matches `destination` in `input`
destination <- centroids[input[,.(destination)]]
setnames(destination, c('East', 'North'), c('xend', 'yend'))
## Bind both results
trajects <- cbind(origin, destination)

### GRAPHICS SECTION

library(lattice)
library(spData)
library(classInt)
## Background set to black
myTheme <- simpleTheme()
myTheme$background$col <- 'white'
## Palette and classes (try grey 70,90)
nClasses <- 5
pal <- colorRampPalette(c('red4', 'red'))(nClasses)
classes <- classIntervals(trajects[total > 0, total],
                          n = nClasses, style = 'quantile')
classes <- findCols(classes)

pdf("flow.pdf")

xyplot(North ~ East, data = centroids,
       pch = '.', col = 'red',
       aspect = 'iso',
       par.settings = myTheme,
       panel = function(...){
         ## panel.xyplot displays the 'centroids'
            panel.xyplot(...) 
         trajects[total > 0,
                  panel.segments(xstart, ystart, xend, yend,
                                 col = pal[classes],
                                 alpha = 0.05, lwd = 0.3)
                  ]
       })
dev.off()