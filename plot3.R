## This first line will likely take a few seconds. Be patient!
nei <- readRDS ("D:/R/JHU/Exploratory Data Analysis/Projects/Project 2/myRepo/required files/summarySCC_PM25.rds")
scc <- readRDS ("D:/R/JHU/Exploratory Data Analysis/Projects/Project 2/myRepo/required files/Source_Classification_Code.rds")

library (ggplot2)

# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999 2008 for Baltimore City? 
# Which have seen increases in emissions from 1999 2008? 
# Use the ggplot2 plotting system to make a plot answer this question.

# 24510 is Baltimore, see plot2.R
subsetnei  <- nei[nei$fips == "24510", ]

sam <- aggregate (Emissions ~ year + type, subsetnei, sum)



png("plot3.png", width = 640, height = 480)
g <- ggplot(sam, aes(year, Emissions, color = type))
g <- g + geom_line() +
  xlab ("year") +
  ylab ("Total Emissions of PM2.5") +
  ggtitle('Total Emissions in Baltimore City, Maryland (fips == "24510") from 1999 to 2008')
print(g)
dev.off()
