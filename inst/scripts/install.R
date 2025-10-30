# Run this before the first time use
#
# > source("/path/to/install.R")

packages = list(
  CRAN = c("remotes", "dplyr", "stars", "shiny", "bslib"),
  GITHUB = c(
    "marinethermohalinewaves" = "BigelowLab",
    "bigelowshinytheme"  = "BigelowLab")
)

installed = installed.packages() |> rownames()

# CRAN
ok = sapply(packages$CRAN,
            function(p){
              if (!p %in% installed) install.packages(p)
            })
# GITHUB
ok = sapply(names(packages$GITHUB),
            function(p){
              if (!p %in% installed) {
                path = file.path(packages$GITHUB[[p]], p)
                remotes::install_github(path, upgrade = FALSE)
              }
            })
