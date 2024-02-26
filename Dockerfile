FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get --quiet update && \
    apt-get --quiet --assume-yes install \
	texlive \
	texlive-extra-utils \
	texlive-lang-european \
	texlive-science \
	texlive-fonts-recommended \
	texlive-fonts-extra \
	build-essential \
	chktex \
	gnuplot \
	language-pack-sv \
	latexmk \
	octave \
	tidy
