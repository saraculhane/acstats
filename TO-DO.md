### Things left to do with Reed Thesis template

1. Create labels for figures/tables stored as pictures (not necessarily **R** created).
  - Likely taken care of by using this:  <https://github.com/lierdakil/pandoc-crossref>
  - Might be better to use this but doesn't include links? <https://github.com/adletaw/captioner>
  - Maybe some guidance here?  <https://github.com/balachia/pandoc-filters>
  - Or here? <https://gist.github.com/balachia/d836f8829aec61cb4b54#file-pandoc-internalref-hs>
  - Or here? <https://github.com/tomduck/pandoc-fignos>
  - Currently using `kfigr` package, but doesn't create link to figure/chunk in PDF (does with HTML)
1. Number equations
  - Maybe using this? <https://github.com/tomduck/pandoc-eqnos>
1. Show how to create tables using Markdown and other examples using **R** (Chapter 4)
1. Show how to scale images in Markdown
1. Add `header-includes` option for those that would like to create Custom Commands using \LaTeX\
  - Some disciplines like Biology (TeXShade) may need to include packages here too
1. Label figures as in Figure 3.1 of Chemistry using Markdown?
1. Test other citation styles and make sure they match Reed College library requirements
1. Check with library about shading code

Useful reference:  <http://pandoc.org/README.html#options>
