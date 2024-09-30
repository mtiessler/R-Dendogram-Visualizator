library(renv)

if (!renv::project() %in% dir()) {
  renv::init()
} else {
  renv::restore()
}

install.packages(c("ggplot2", "ggdendro", "dendextend", "cluster"))

library(ggplot2)
library(ggdendro)
library(dendextend)
library(cluster)
