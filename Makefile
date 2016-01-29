cv_root = ashley.hindmarsh.cv
cv_markdown = $(cv_root).md
pwd = $(shell pwd)
docker_cmd = docker run -v $(pwd):/docs vpetersson/pandoc /bin/sh -c

.PHONY: all pdf html doc

all: outdir pdf html doc

outdir:
	mkdir -p out

pdf: outdir $(cv_markdown)
	$(docker_cmd) "pandoc -V geometry:margin=1in -t latex -o out/$(cv_root).pdf $(cv_root).md"

html: outdir $(cv_markdown)
	$(docker_cmd) "pandoc -o out/$(cv_root).html $(cv_root).md"

doc: outdir $(cv_markdown)
	$(docker_cmd) "pandoc -o out/$(cv_root).docx $(cv_root).md"

clean:
	rm -r out
