library(ggplot2)
pdf("graphs.pdf")
inboxData <- read.table('inbox_data.csv', header=TRUE, sep=',')
sentData <- read.table('sent_data.csv', header=TRUE, sep=',')

dates <- as.Date(inboxData$date, "%Y-%m-%d%T%H:%M:%S")
elements <- format(dates, '%d')
inboxCount <- data.frame(table(elements))$Freq

dates <- as.Date(sentData$date, "%Y-%m-%d%T%H:%M:%S")
elements <- format(dates, '%d')
sentCount <- data.frame(table(elements))$Freq

daysOfMonth <- c("01", "02", "03", "04", "05", "06", "07", "08", "09", "10",
    "11", "12", "13", "14", "15", "16", "17", "18", "19", "20",
    "21", "22", "23", "24", "25", "26", "27", "28", "29", "30",
    "31")

#df <- data.frame(days=1:31, inbox=inboxCount, sent=sentCount)
df <- data.frame(days=factor(daysOfMonth, levels=daysOfMonth), inbox=inboxCount, sent=sentCount)

ggplot(data=df) + scale_shape_manual(name="Mailbox", values=c(2,3)) +
    geom_point(aes(x=days, y=inbox, shape='inbox')) +
    geom_smooth(aes(x=days, y=inbox, shape='inbox', group=1)) +
    geom_point(aes(x=days, y=inbox, shape='sent')) +
    geom_smooth(aes(x=days, y=inbox, shape='sent', group=2)) +
    scale_y_continuous('number of days') +
    scale_x_continuous('day of month')
    
