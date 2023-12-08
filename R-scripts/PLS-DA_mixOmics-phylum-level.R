data <- read.csv("plsda-bacteria_sums.csv")
category_mapping <- c("Base_of_tongue" = 1, "Floor_of_mouth" = 2, "Gum" = 3, "Larynx" = 4)
data$Y_numeric <- category_mapping[data$Primary_Site]
numeric_cols <- c("Firmicutes", "Actinobacteria", "Bacteroidetes", "Chlamydiae", "Proteobacteria",
                  "k_Bacteria", "Cyanobacteria", "Chloroflexi", "Gemmatimonadetes", "Aquificae",
                  "Acidobacteria", "Thermotogae", "Deinococcus", "Synergistetes", "Planctomycetes",
                  "Fibrobacteres", "Tenericutes", "Spirochaetes", "Verrucomicrobia", "Nitrospirae",
                  "Fusobacteria", "Thermodesulfobacteria", "Armatimonadetes", "Ignavibacteriae",
                  "Chlorobi", "Caldiserica", "Lentisphaerae", "Candidatus_Cloacimonetes", "Chrysiogenetes",
                  "Deferribacteres", "Elusimicrobia", "Rhodothermaeota", "Nitrospinae", "Dictyoglomi")

library(mixOmics)
plsda_result <- plsda(X = data[, numeric_cols], Y = data$Y_numeric, ncomp = 2)
plotIndiv(
  plsda_result, 
  ind.names = FALSE, 
  legend = TRUE, 
  comp = c(1, 2), 
  ellipse = TRUE, 
  title = 'Bacteria: Phylum Level',
  col.ind = df$Primary_site  
)
