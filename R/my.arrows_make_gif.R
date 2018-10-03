library(magick)

rm(list = ls())

source("R/my.arrows.R")

r = 2
xs <- c(1/2, sqrt(3)/2)
x1 <- c(0, xs, 1,  rev(xs), 0, -c(xs), -1,  -rev(xs), 1) * r
y1 <- sqrt(r^2 - x1^2) * c(1, 1, 1, 1, -1,-1,-1,-1,-1,1,1,1,1)

X <- data.frame(x0 = 0, y0 = 0, x1, y1)




for(r in 1:100){
  print(r)
 ( i <- sample(x = 1:nrow(X), size = 1))
  
  png("arrows.png", width = 200, height = 200, units = "px", res = 96, )
  par(mar = c(0,0,0,0))
  plot(-2:2, -2:2, axes = F, xlab = "", ylab= "", type = "n")
  arrow.coordinates <- as.list(X[i,])
  my.arrows(arrow.coordinates, arr.width = rlnorm(1, 0, 0.5))
  
  dev.off()
  
  
  
  img <- image_read("arrows.png")
  
  if(r == 1 ) all_img <- img else  all_img <- image_scale(c(all_img, img), "200")
  
 
}

animation <-  image_animate(all_img, fps = 1)

image_write(animation, path = "img/portfolio/my_arrows.gif", format = "gif")
