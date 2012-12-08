library(ggplot2)
supply <- read.table("supply_data.csv", header=F, sep=",")
price <- read.table("price_data.csv", header=F, sep=",")

pdf("graphs.pdf")

ggplot(data = supply) + scale_color_grey(name="Supply") +
    geom_line(aes(x=V1, y=V2, color="chickens")) +
    geom_line(aes(x=V1, y=V3, color="ducks")) +
    scale_y_continuous("amount") +
    scale_x_continuous("time")

ggplot(data = price) + scale_color_grey(name="Price") +
    geom_line(aes(x=V1, y=V2, color="chickens")) +
    geom_line(aes(x=V1, y=V3, color="ducks")) +
    scale_y_continuous("amount") +
    scale_x_continuous("time")


dev.off()
