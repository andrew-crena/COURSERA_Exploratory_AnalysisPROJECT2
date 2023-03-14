# Question : Of the four types of sources indicated by the type (point, 
# nonpoint, onroad, nonroad) variable, which of these four sources 
# have seen decreases in emissions from 1999–2008 for Baltimore City? 
# 
# Which have seen increases in emissions from 1999–2008? Use the ggplot2
# plotting system to make a plot answer this question.

## Reading the data into working directory

NEI <- readRDS("~/R_Programming/DATASETS/
                 exdata_data_NEI_data/summarySCC_PM25.rds")

SCC <- readRDS("~/R_Programming/DATASETS/exdata_data_NEI_data/
                 Source_Classification_Code.rds")

library(dplyr)
library(ggplot2)

balt_type <- NEI %>% select(type, fips, Emissions, year) %>%
    filter(fips == '24510')

g3 <- ggplot(balt_type, aes(factor(year), Emissions), fill = type)
g3 + geom_bar(stat = "identity") +
    theme_bw(base_family = "Helvetica") +
    facet_wrap(. ~ type, nrow = 2, ncol = 2) +
    labs(x = "Years",
         y = "Total Emissions",
         title = "Total Emissions in Baltimore City by Source types") +
    ggsave("plot3.png", width = 30, height = 30, units = "cm")
