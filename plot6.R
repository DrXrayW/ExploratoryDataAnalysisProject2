library(plyr)
library(ggplot2)

# Read data

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Filter by (fips == '24510' or fips == '06037') and type == 'ON-ROAD'
selected <- NEI[(NEI$fips=="24510" | NEI$fips=="06037" ) & NEI$type == 'ON-ROAD',]

# Get group sums by year
typePM25ByYear <- ddply(selected, .(fips, year), summarize, totalEmissions = sum(Emissions))

# Give the two areas readable names
typePM25ByYear = mutate(typePM25ByYear, area = ifelse(fips=='24510', 'Baltimore City', 'Los Angeles County'))

# Open png device, set a larger width as we will have a longer title

png('plot6.png', width = 960)

#The actual plotting
qplot(year, totalEmissions, data=typePM25ByYear, geom="line", color = area) + 
  xlab("year") + 
  ylab("total emissions (tons)") + 
  ggtitle("Emissions by Year From Motor Vehicle In Baltimore City and Los Angels County")

# Close and save png device

dev.off()

