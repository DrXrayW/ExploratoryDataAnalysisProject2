library(plyr)
library(ggplot2)

# Read data

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Filter by fips == '24510'

selected <- NEI[NEI$fips=="24510",]

# Get group sums by type and year
typePM25ByTypeAndYear <- ddply(selected, .(type, year), summarize, totalEmissions = sum(Emissions))

# Open png device

png('plot3.png')

#The actual plotting
qplot(year, totalEmissions, data=typePM25ByTypeAndYear, color = type, geom="line") + 
  xlab("year") + 
  ylab("total emissions (tons)") + 
  ggtitle("Emissions by Source Type and Year in Baltimal City")

# Close and save png device

dev.off()
