rm -f *.pdf
rm -f *.tex

pandoc ../BOOK.md -s -o SoC-FinTech.pdf
pandoc ../BOOK.md -s -o SoC-FinTech.tex
