label <- function(path = NULL,
                          caption = "Default caption",
                          scale = 1,
                          label = "def",
                          type = "figure",
                  options = "htbp"
){
  if(type == "figure"){
  cat(
    paste0(
      "\n\\begin{figure}[", options, "]\n",
      "\\centering\n",
      "\\includegraphics[scale = ", scale, "]{",
    path, "}\n",
     "\\caption{", caption,"}\n",
     "\\label{fig:", label, "}\n",
     "\\end{figure}"
    )
  )
  }
  if(type == "table"){



  }
}



ref <- function(label = "def", type = "figure"){
  paste0("\\autoref{",
         ifelse(type == "figure", "fig:",
                ifelse(type == "table", "tab:",
                       ifelse(type == "equation", "eq:","")
                )
         ),
         label, "}")
}

