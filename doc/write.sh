rm -f *.pdf
rm -f *.tex

pandoc PRELUDE-TT.md -s -o SoC-TT-NTM.pdf
pandoc BOOK.md -s -o SoC-FinTech.pdf

pandoc PRELUDE-TT.md -s -o PU-TT-NTM.tex
pandoc BOOK.md -s -o SoC-FinTech.tex
