library(plyr)
library(ggplot2)

# Read data

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Merge data
data <- merge(NEI, SCC, by="SCC")

# Filter by Comb and Coal in the EI sector

selected <- data[grep("Comb.*Coal", data$EI.Sector), ]

# Get group sums by year
typePM25ByYear <- ddply(selected, .(year), summarize, totalEmissions = sum(Emissions))

# Open png device

png('plot4.png')

#The actual plotting
qplot(year, totalEmissions, data=typePM25ByYear, geom="line") + 
  xlab("year") + 
  ylab("total emissions (tons)") + 
  ggtitle("Emissions by Year from Coal Combustion")

# Close and save png device

dev.off()

