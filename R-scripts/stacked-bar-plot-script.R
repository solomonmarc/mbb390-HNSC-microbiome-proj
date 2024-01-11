library(ggplot2)
library(dplyr)
library(RColorBrewer)

data <- read.csv("archaea_allsites_top4phyla.csv")
data$Percentage <- as.numeric(data$Percentage)

legend_order <- c("Crenarchaeota", "Euryarchaeota", "Thaumarchaeota", "Candidatus_Korarchaeota")
data$Phylum <- factor(data$Phylum, levels = legend_order)

ggplot(data, aes(x = Site, y = Percentage, fill = Phylum)) +
  geom_bar(position = "fill", stat = "identity") +
  labs(title = " ",
       x = "Site",
       y = "Percentage") +
  scale_fill_brewer(palette = "Set2") + 
  theme_minimal() +
  guides(fill = guide_legend(title = "Phylum", key_glyph = "rect")) +
  scale_fill_manual(values = brewer.pal(n = length(unique(data$Phylum)), name = "Set2"),
                    breaks = legend_order)
