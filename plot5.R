# How have emissions from motor vehicle sources changed from 1999–2008 
# in Baltimore City?

## Reading the data into working directory

NEI <- readRDS("~/R_Programming/DATASETS/
                 exdata_data_NEI_data/summarySCC_PM25.rds")

SCC <- readRDS("~/R_Programming/DATASETS/exdata_data_NEI_data/
                 Source_Classification_Code.rds")


library(dplyr)
library(ggplot2)
library(stringr)


vehicleSCC <- filter(SCC, str_detect(SCC.Level.Two, "[Vv]ehicle"))
vehicleNEI <- filter(NEI, SCC %in% vehicleSCC$SCC)

balt_vehicleNEI <- filter(vehicleNEI, fips=="24510")

g5 <- ggplot(balt_vehicleNEI, aes(factor(year), Emissions))
g5 + geom_bar(stat="identity") +
    theme_bw(base_family = "Helvetica") +
    labs(x="Years", y="Total emissions", 
         title="Motor Vehicle Sources Emissions in Baltimore from 1999 to 2008") + 
    ggsave("plot5.png", width = 30, height = 30, units = "cm")