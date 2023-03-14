# Across the United States, how have emissions from coal combustion-related 
# sources changed from 1999–2008?

## Reading the data into working directory

NEI <- readRDS("~/R_Programming/DATASETS/
                 exdata_data_NEI_data/summarySCC_PM25.rds")

SCC <- readRDS("~/R_Programming/DATASETS/exdata_data_NEI_data/
                 Source_Classification_Code.rds")

SCC_coal_comb <- SCC %>%
    filter(str_detect(SCC.Level.One, "[Cc]omb")) %>%
    filter(str_detect(SCC.Level.Three, "[Cc]oal")) %>%
    filter(str_detect(SCC.Level.Four, "[Cc]oal"))
NEI_coal_comb <- filter(NEI, SCC %in% SCC_coal_comb$SCC)

g4 <- ggplot(NEI_coal_comb, aes(factor(year), Emissions))
g4 + geom_bar(stat = "identity") +
    theme_bw(base_family = "Helvetica") +
    labs(x = "Years", y = "Total Emissions", 
         title = "Coal Combustion Source emissions across US from 1999 to 2008") +
    ggsave("plot4.png", width = 30, height = 30, units = "cm")