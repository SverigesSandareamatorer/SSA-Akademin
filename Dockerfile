FROM debian:testing
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y \
    make \
    sshpass
RUN apt-get install -y \
    texlive \
    texlive-lang-european \
    texlive-latex-extra \
    texlive-pictures \
    texlive-science-doc \
    texlive-science
RUN apt-get install -y \
    texlive-xetex
