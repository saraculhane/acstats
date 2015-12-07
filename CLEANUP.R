unlink("MyAmherstThesis", recursive = TRUE)
devtools::install_github("swang87/rticles")
rmarkdown::draft("MyAmherstThesis.rmd", template = "amherst_thesis", package = "rticles",
                 edit = TRUE)
