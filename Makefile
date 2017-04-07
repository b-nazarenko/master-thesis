all: build run

build:
	latexmk -xelatex -synctex=1 -jobname=master-thesis main.tex
	
run:
	# Я использую xreader для просмотра PDF
	xreader master-thesis.pdf &
	
clean:
	rm *.aux \
	*.fdb_latexmk \
	*.fls \
	*.lof \
	*.lot \
	*.log \
	*.out \
	*.synctex.gz \
	*.toc

docker:
	docker build -t docker-latex .
	docker run -ti -v ../master-thesis:/master-thesis:Z docker-latex bash -c "make build && make clean"
