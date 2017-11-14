png("img/dino.png", 640, 480)
par(mar = c(10,12,10,12))
plot(datasaurus_dozen_wide$dino_x, datasaurus_dozen_wide$dino_y, 
     pch = 20, main = "", ylab = "Y", xlab = "", axes = F)
axis(side = 2, at = c(0, 100), lwd = .5, lwd.ticks = .1)
dev.off()

require(magick)

img <- image_graph(width = 600, height = 600, res = 96)
for (i in 0:9) {
  p <- ggplot(datasaurus_dozen[1:142 + (142 * i), ], aes(x = x, y = y)) +
    geom_point() + 
    theme_minimal() + 
    scale_x_continuous(limits = c(0, 100)) + 
    scale_y_continuous(limits = c(0, 100)) + 
    labs(title = datasaurus_dozen$dataset[1 + 142 * i])
  print(p)
}
dev.off()
img <- image_background(image_trim(img), 'white')
animation <- image_animate(img, fps = 1)
image_write(animation, "img/dino.gif")