function markdown_to_docx
  cat $argv[1] | sed -e 's/、/，/g' | sed -e 's/。/．/g' | pandoc -o $argv[2] --pdf-engine=lualatex -F pandoc-crossref -C -N -V documentclass=ltjsarticle --reference-doc=template.docx
end
