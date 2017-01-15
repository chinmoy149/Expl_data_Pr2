## This first line will likely take a few seconds. Be patient!
nei <- readRDS ("D:/R/JHU/Exploratory Data Analysis/Projects/Project 2/myRepo/required files/summarySCC_PM25.rds")

# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system,
# make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

sam <- aggregate (Emissions ~ year, nei, sum)

# selected output device as a png file
png ('plot1.png')
barplot (height = sam$Emissions, names.arg = sam$year, ylab = "Total Emissions of PM2.5", xlab = "Year", main = "PLOT 1")
dev.off()