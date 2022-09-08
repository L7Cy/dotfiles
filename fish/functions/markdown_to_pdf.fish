function markdown_to_pdf
  cat $argv[1] | sed -e 's/、/，/g' | sed -e 's/。/．/g' | pandoc -o $argv[2] --pdf-engine=xelatex -F pandoc-crossref -C -N -V documentclass=bxjsarticle -V ja=standerd -V classoption=pandoc --highlight-style=tango
end
