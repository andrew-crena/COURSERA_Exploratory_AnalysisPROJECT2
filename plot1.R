# Question: Have total emissions from PM2.5 decreased in the United States from
# 1999 to 2008? Using the base plotting system, make a plot showing the total
# PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and
# 2008.

## Reading the data into working directory

NEI <- readRDS("~/R_Programming/DATASETS/
                 exdata_data_NEI_data/summarySCC_PM25.rds")

SCC <- readRDS("~/R_Programming/DATASETS/exdata_data_NEI_data/
                 Source_Classification_Code.rds")


library(dplyr)

NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")

# data tidying for plot
total <- NEI %>% select(Emissions, year) %>%
    group_by(year) %>%
    mutate(year = factor(year)) %>%
    summarize(total_em = sum(Emissions))

png(filename = "plot1.png")

# create bar plot with base R
with(
    total,
    barplot(
        total_em,
        names = year,
        xlab = "Years",
        ylab = "Emissions",
        main = "Emissions over the years"
    )
)

dev.off()