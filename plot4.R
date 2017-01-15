## This first line will likely take a few seconds. Be patient!
nei <- readRDS ("D:/R/JHU/Exploratory Data Analysis/Projects/Project 2/myRepo/required files/summarySCC_PM25.rds")
scc <- readRDS ("D:/R/JHU/Exploratory Data Analysis/Projects/Project 2/myRepo/required files/Source_Classification_Code.rds")
# merge the two data sets 

neiscc <- merge (nei, scc, by = "SCC")

library (ggplot2)

# Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?

# fetch all NEIxSCC records with Short.Name (SCC) Coal
coalMatches  <- grepl ("coal", neiscc$Short.Name, ignore.case = TRUE)
subsetNEISCC <- neiscc[coalMatches, ]

sam <- aggregate (Emissions ~ year, subsetNEISCC, sum)

# selected output device as a png file
png ("plot4.png", width = 640, height=480)
g <- ggplot (sam, aes (factor (year), Emissions))
g <- g + geom_bar (stat = "identity") +
  xlab ("year") +
  ylab ("Total Emissions pf PM2.5") +
  ggtitle ('Total Emissions from coal sources from 1999 to 2008')
print (g)
dev.off()