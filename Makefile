cv_root = cv2015.contract
cv_markdown = $(cv_root).md
pwd = $(shell pwd)
docker_cmd = docker run -v $(pwd):/docs vpetersson/pandoc /bin/sh -c

.PHONY: all pdf html doc

all: outdir pdf html doc

outdir:
	mkdir -p out

pdf: outdir $(cv_markdown)
	$(docker_cmd) "pandoc -V geometry:margin=1in -t latex -o out/cv2015.contract.pdf cv2015.contract.md"

html: outdir $(cv_markdown)
	$(docker_cmd) "pandoc -o out/$(cv_root).html cv2015.contract.md"

doc: outdir $(cv_markdown)
	$(docker_cmd) "pandoc -o out/$(cv_root).docx cv2015.contract.md"

clean:
	rm -r out
