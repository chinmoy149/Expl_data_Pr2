## This first line will likely take a few seconds. Be patient!
nei <- readRDS ("D:/R/JHU/Exploratory Data Analysis/Projects/Project 2/myRepo/required files/summarySCC_PM25.rds")
scc <- readRDS ("D:/R/JHU/Exploratory Data Analysis/Projects/Project 2/myRepo/required files/Source_Classification_Code.rds")

library (ggplot2)

# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

# 24510 is Baltimore, see plot2.R
# Searching for ON-ROAD type in NEI
# Don't actually know it this is the intention, but searching for 'motor' in SCC only gave a subset (non-cars)
subsetnei <- nei [nei$fips == "24510" & nei$type == "ON-ROAD",  ]

sam <- aggregate (Emissions ~ year, subsetnei, sum)

png("plot5.png", width = 840, height = 480)
g <- ggplot (sam, aes(factor(year), Emissions))
g <- g + geom_bar (stat="identity") +
  xlab ("year") +
  ylab ("Total Emissions pf PM2.5") +
  ggtitle('Total Emissions from motor vehicle (type = ON-ROAD) in Baltimore City, Maryland (fips = "24510") from 1999 to 2008')
print(g)
dev.off()
