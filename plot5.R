library(plyr)
library(ggplot2)

# Read data

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Filter by fips == '24510' and type == 'ON-ROAD'
selected <- NEI[NEI$fips=="24510" & NEI$type == 'ON-ROAD',]

# Get group sums by year
typePM25ByYear <- ddply(selected, .(year), summarize, totalEmissions = sum(Emissions))

# Open png device

png('plot5.png')

#The actual plotting
qplot(year, totalEmissions, data=typePM25ByYear, geom="line") + 
  xlab("year") + 
  ylab("total emissions (tons)") + 
  ggtitle("Emissions by Year From Motor Vehicle In Baltimore City")

# Close and save png device

dev.off()

