### Overview

The **acstats** package (derived from Chester Ismay's **reedtemplates** package at `ismayc/reedtemplates` with only minor modifications) includes a  [R Markdown](http://rmarkdown.rstudio.com) template for the Amherst College Statistics Comprehensive Evaluation report. If you'd like to see the PDF document the template produces, it can be found [here](https://github.com/ismayc/reedtemplates/blob/master/inst/rmarkdown/templates/reed_thesis/skeleton/skeleton.pdf).

Under the hood, LaTeX templates are used to ensure that documents conform precisely to submission standards. At the same time, composition and formatting can be done using lightweight [markdown](http://rmarkdown.rstudio.com/authoring_basics.html) syntax, and **R** code and its output can be seamlessly included using [knitr](http://yihui.name/knitr/).

The **acstats** package has some prerequisites which are described below. To compile PDF documents using **R**, you are going to need to have LaTeX installed.  It can be downloaded for Windows at <http://http://miktex.org/download> and for Mac at <http://tug.org/mactex/mactex-download.html>.  Follow the instructions to install the necessary packages after downloading the (somewhat large) installer files.  You may need to install a few extra LaTeX packages on your first attempt to knit as well.

### Using acstats from Susan's GitHub

To use **acstats** from RStudio (including the Amherst College RStudio server):

1. Within RStudio, install the package:

```
install.packages("devtools")
devtools::install_github("swang87/acstats")
```

2. Use the **New R Markdown** dialog to create an article from one of the templates:

![New R Markdown](acstats_template.png)
