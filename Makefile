rmdfile = README.Rmd
mdfile = $(rmdfile:%.Rmd=%.md)
pdffile = $(rmdfile:%.Rmd=%.pdf)
htmlfile = $(rmdfile:%.Rmd=%.html)

.PHONY: all
all: $(htmlfile) $(pdffile) $(mdfile)

$(pdffile): $(rmdfile)
	Rscript -e 'rmarkdown::render("$^",output_format="pdf_document")'

$(htmlfile): $(rmdfile)
	Rscript -e 'rmarkdown::render("$^",output_format="html_document")'

$(mdfile): $(rmdfile)
	Rscript -e 'rmarkdown::render("$^",output_format="md_document")'
