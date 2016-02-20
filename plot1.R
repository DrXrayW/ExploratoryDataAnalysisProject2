# Read data

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Calculate the total emissions for each year

totalPM25ByYear <- tapply(NEI$Emissions, NEI$year, sum)

# Open png device

png('plot1.png')

#The actual plotting

plot(names(totalPM25ByYear), 
     totalPM25ByYear, 
     type='l', 
     xlab="year", 
     ylab="total PM2.5 Emission (tons)", 
     main="Total PM2.5 Emission By Year")

# Close and save png device

dev.off()
