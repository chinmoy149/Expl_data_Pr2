## This first line will likely take a few seconds. Be patient!
nei <- readRDS ("D:/R/JHU/Exploratory Data Analysis/Projects/Project 2/myRepo/required files/summarySCC_PM25.rds")
scc <- readRDS ("D:/R/JHU/Exploratory Data Analysis/Projects/Project 2/myRepo/required files/Source_Classification_Code.rds")
# merge the two data sets 

neiscc <- merge (nei, scc, by = "SCC")

library (ggplot2)

# Compare emissions from motor vehicle sources in Baltimore City with emissions from motor 
# vehicle sources in Los Angeles County, California (fips == "06037"). 
# Which city has seen greater changes over time in motor vehicle emissions?

# 24510 is Baltimore, see plot2.R, 06037 is LA CA
# Searching for ON-ROAD type in NEI
# Don't actually know it this is the intention, but searching for 'motor' in SCC only gave a subset (non-cars)
subsetnei <- nei[(nei$fips == "24510" | nei$fips == "06037") & nei$type == "ON-ROAD",  ]

sam <- aggregate (Emissions ~ year + fips, subsetnei, sum)
sam$fips[sam$fips == "24510"] <- "Baltimore, MD"
sam$fips[sam$fips == "06037"] <- "Los Angeles, CA"

png ("plot6.png", width = 1040, height = 480)
g <- ggplot(sam, aes (factor (year), Emissions))
g <- g + facet_grid(. ~ fips)
g <- g + geom_bar(stat = "identity")  +
  xlab("year") +
  ylab("Total Emissions of PM2.5") +
  ggtitle('Total Emissions from motor vehicle (type=ON-ROAD) in Baltimore City, MD (fips = "24510") vs Los Angeles, CA (fips = "06037")  1999-2008')
print(g)
dev.off()