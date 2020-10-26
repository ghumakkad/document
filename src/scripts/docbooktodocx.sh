if ! [ -x "$(command -v pandoc)" ]; then
  echo 'Error: pandoc is not installed. To install pandoc, please visit https://pandoc.org/installing.html' >&1
  exit 1
fi
mkdir -p ../docx
for f in *.xml; do pandoc "$f" -r docbook -t docx -s --data-dir "$2/src/theme/docx" -o "../docx/${f%.xml}.docx"; done