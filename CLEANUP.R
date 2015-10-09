unlink("MyReedThesis", recursive = TRUE)
devtools::install_github("ismayc/rticles")
rmarkdown::draft("MyReedThesis.rmd", template = "reed_thesis", package = "ismayc/rticles", edit = TRUE)
