library(ggplot2)
library(dplyr)
library(RColorBrewer)

data <- read.csv("viruses_allsites_top5family.csv")
data$Percentage <- as.numeric(data$Percentage)

legend_order <- c("Papillomaviridae", "Polydnaviridae", "Herpesviridae", "Alloherpesviridae", "Betaflexiviridae", "Phycodnaviridae", "Partitiviridae", "Others")

ggplot(data, aes(x = Site, y = Percentage, fill = Phylum)) +
  geom_bar(position = "fill", stat = "identity") +
  labs(title = " ",
       x = "Site",
       y = "Percentage") +
  scale_fill_brewer(palette = "Dark2") + 
  theme_minimal() +
  guides(fill = guide_legend(title = "Phylum", key_glyph = "rect")) +
  scale_fill_manual(values = brewer.pal(n = length(unique(data$Phylum)), name = "Dark2"),
                    breaks = legend_order)
