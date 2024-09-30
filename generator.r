# Load necessary libraries
library(ggplot2)
library(ggdendro)
library(dendextend)

# Function to read CSV and generate dendrogram
generate_dendrogram <- function(csv_file) {
  # Read the CSV file
  data <- read.csv(csv_file, row.names = 1)
  
  # Perform hierarchical clustering
  distance_matrix <- dist(data)  # Compute distance matrix
  clustering <- hclust(distance_matrix)  # Perform hierarchical clustering
  
  # Convert to a dendrogram object
  dendro <- as.dendrogram(clustering)
  
  # Create a ggplot object for the dendrogram
  gg_dendro <- ggdendrogram(dendro, rotate = TRUE, size = 2) +
    labs(title = "Dendrogram of Clustering",
         x = "Samples",
         y = "Height") +
    theme_minimal()
  
  # Plot the dendrogram
  print(gg_dendro)
  
  # Save the plot to a file
  ggsave("dendrogram.png", plot = gg_dendro, width = 10, height = 8)
}

# Example usage
csv_file_path <- "C:\\Users\\Max\\NLP4RE\\Dendogram-Generator\\static\\csv\\WhatsApp_bert_cosine_average_results.csv"
generate_dendrogram(csv_file_path)
