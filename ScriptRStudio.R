library(raster)
library(rgdal)
library(dplyr)

csv.res <- read.csv("results_cnn3.csv")
csv.res <- data.frame(csv.res)

xmean <- list()
ymean <- list()
val <- list()

prob <- csv.res$output
path <- csv.res$name

for(i in 1:length(path)){
  print(paste0("start ", i, "/", length(path)))
  rst <- raster(path[i])
  a <- extent(rst)
  a <- as.vector(a)
  xmean[i] <- a[1] + ((a[2] - a[1])/2)
  ymean[i] <- a[3] + ((a[4] - a[3])/2)
  val[i] <- as.numeric(prob[i])
}

haha <- cbind(xmean,ymean,val)
haha
write.csv(haha, "plot_nilai_prob2.csv")
