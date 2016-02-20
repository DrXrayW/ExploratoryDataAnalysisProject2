# Read data

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Filter by fips == '24510'

selected <- NEI[NEI$fips=="24510",]

# Calculate the total emissions for each year

totalPM25ByYear <- tapply(selected$Emissions, selected$year, sum)

# Open png device

png('plot2.png')

#The actual plotting

plot(names(totalPM25ByYear), 
     totalPM25ByYear, 
     type='l', 
     xlab="year", 
     ylab="total PM2.5 Emission (tons)", 
     main="Total PM2.5 Emission By Year In Baltimore City")

# Close and save png device

dev.off()
