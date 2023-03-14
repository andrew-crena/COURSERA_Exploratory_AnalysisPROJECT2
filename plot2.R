# Question: Have total emissions from PM2.5 decreased in the Baltimore City,
# Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system
# to make a plot answering this question.

## Reading the data into working directory

NEI <- readRDS("~/R_Programming/DATASETS/
                 exdata_data_NEI_data/summarySCC_PM25.rds")

SCC <- readRDS("~/R_Programming/DATASETS/exdata_data_NEI_data/
                 Source_Classification_Code.rds")

library(dplyr)

NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")

balt <- NEI %>% select(fips, Emissions, year) %>%
    filter(fips == '24510') %>%
    group_by(year) %>%
    mutate(year = factor(year)) %>%
    summarize(total_em = sum(Emissions))

png(filename = "plot2.png")

with(
    balt,
    barplot(
        total_em,
        names = year,
        xlab = "Years",
        ylab = "Emissions",
        main = "Total Emissions in Baltimore City from 1999 to 2008"
    )
)

dev.off()