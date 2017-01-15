## This first line will likely take a few seconds. Be patient!
nei <- readRDS ("D:/R/JHU/Exploratory Data Analysis/Projects/Project 2/myRepo/required files/summarySCC_PM25.rds")
scc <- readRDS ("D:/R/JHU/Exploratory Data Analysis/Projects/Project 2/myRepo/required files/Source_Classification_Code.rds")

# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question.

baltimore <- nei [nei$fips == "24510", ]

sam <- aggregate (Emissions ~ year, baltimore, sum)

# selected output device as a png file
png ('plot1.png')
barplot (height = sam$Emissions, names.arg = sam$year, ylab = "Total Emissions of PM2.5 in Baltimore", xlab = "Year", main = "PLOT 2")
dev.off()