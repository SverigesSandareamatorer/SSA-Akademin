FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN sudo apt-get --quiet update && \
    sudo apt-get --quiet --assume-yes install \
	texlive \
	texlive-extra-utils \
	texlive-lang-european \
	texlive-science \
	texlive-fonts-recommended \
	texlive-fonts-extra \
	latexmk \
	tidy \
	chktex \
	octave \
	gnuplot \
	build-essentials \
	language-pack-sv

RUN localectl set-locale LANG="sv_SE.UTF-8"
