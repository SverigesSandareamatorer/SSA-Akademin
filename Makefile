DOCKER_IMAGE_NAME=	ssa-koncept

all:
	-pdflatex koncept.tex
	pdflatex koncept.tex

# Optionally build using docker, currently only tested with MacOS and Docker 1.12.3, but
# should work anywhere you can run Docker.
# To build using Docker, run 'make docker-image' first which will take quite some time,
# then run 'make docker-build' which will 'run make' all inside the Docker container.
docker-image:
	docker build -t ${DOCKER_IMAGE_NAME} .

docker-build:
	docker run -ti --rm -v $(shell pwd):/work -w /work ${DOCKER_IMAGE_NAME} make all

clean:
	-rm -f *.aux *.idx *.lof *.log *.lot *.pdf *.toc *~
