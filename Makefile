all: index.html index.pdf index.docx index.txt

index.html: resume.md style.css
	pandoc --standalone -c style.css --from markdown --to html -o index.html resume.md

index.pdf: index.html
	wkhtmltopdf -L 50 -R 50 index.html index.pdf

index.docx: resume.md
	pandoc --from markdown --to docx -o index.docx resume.md

index.txt: resume.md
	pandoc --standalone --smart --from markdown --to plain -o index.txt resume.md

clean:
	rm -f *.html *.pdf *.docx *.txt
