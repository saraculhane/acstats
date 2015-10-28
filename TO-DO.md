### Things left to do with Reed Thesis template

1. Might need to turn off links? <http://tex.stackexchange.com/questions/823/remove-ugly-borders-around-clickable-cross-references-and-hyperlinks>
1. Add capability to include abstract, dedication, etc. in a file instead of inline in the YAML header?
1. Look into changing bibliography description to Zotero.  Albert Kim recommended the tutorial at <http://sites.middlebury.edu/zoteromiddlebury/>

#### Down the road

1. Create manual pages and vignettes and documentation
1. Test other citation styles as faculty/students request
1. Add Table of Abbreviations (maybe in a text file/Rmd file?)
1. Use index features like Hadley did in adv-r
1. Submit to CRAN
1. Allow for documents to be produced in epub/html formats as well as PDF format

<!-- Useful LaTeX reference
  <https://upload.wikimedia.org/wikipedia/commons/2/2d/LaTeX.pdf>
-->

<!-- COMPLETED

1. Create labels for figures/tables stored as pictures (not necessarily **R** created).
  - Trying to use `captioner` package by `adletaw` (<https://github.com/adletaw/captioner>) and modified by `bbest`, forked into `ismayc`
      - Has links built in (`bbest`) and can specify figures, tables, equations (Only works with HTML?)
      - Need to tweak a bit to get `\label` and `\caption` inside `\includegraphics` (<http://yihui.name/knitr/hooks/>)
      - Maybe use Hadley's `embed_png` function to correctly add captions and `\label` to plots (and scale images?) ?
      - Need to make sure subscripts/superscripts work in captions (<https://github.com/adletaw/captioner/issues/7>)
2. Show how to create tables using _Markdown_ and other examples using **R** (Chapter 4)
3. Add `header-includes` option for those that would like to create Custom Commands using \LaTeX\
  - Some disciplines like Biology (TeXShade) may need to include packages here too
  - Check to make sure working now by adding custom command?
4. Label figures as in Figure 3.1 of Chemistry using Markdown?
5. Describe saving R plot output and label
6. Change coloring of R input to match Knit output 
7. Describe use of `cache = TRUE`


<!--  Avoiding since might be a mess to install extra things on the user's end / I haven't tested these yet
  - Likely taken care of by using this (but will need to install pandoc filter...might not be capable in **R** package?):  <https://github.com/lierdakil/pandoc-crossref>
  - Maybe some guidance here?  <https://github.com/balachia/pandoc-filters>
  - Or here? <https://gist.github.com/balachia/d836f8829aec61cb4b54#file-pandoc-internalref-hs>
  - Or here? <https://github.com/tomduck/pandoc-fignos>

1. Number equations
  - Maybe using this? <https://github.com/tomduck/pandoc-eqnos>
  
  Useful reference:  <http://pandoc.org/README.html#options>

-->
