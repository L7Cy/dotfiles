function markdown_to_pdf_1
  cat $argv[1] | sed -e 's/、/，/g' | sed -e 's/。/．/g' | pandoc -o $argv[2] --pdf-engine=lualatex -F pandoc-crossref -N -V documentclass=ltjsarticle
end
