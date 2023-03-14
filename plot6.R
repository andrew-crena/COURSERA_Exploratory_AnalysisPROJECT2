# Compare emissions from motor vehicle sources in Baltimore City with emissions
# from motor vehicle sources in Los Angeles County, California (fips == "06037").
# Which city has seen greater changes over time in motor vehicle emissions?

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

balt_la <- vehicleNEI %>% filter(fips %in% c("24510", "06037"))

facet_labels <- as_labeller(c(`24510` = "Baltimore City", `06037` = "Los Angeles County"))

g6 <- ggplot(balt_la, aes(factor(year), Emissions), fill = fips)
g6 + geom_bar(stat = "identity") +
    theme_bw(base_family = "Helvetica") +
    facet_grid(. ~ fips, labeller = facet_labels) +
    labs(x = "Years", y = "Total emissions", 
         title = "Motor Vehicle Emissions between Baltimore & LA County from 1999 to 2008") +
    ggsave("plot6.png", width = 30, height = 30, units = "cm")