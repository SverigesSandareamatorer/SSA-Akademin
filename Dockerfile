FROM debian:testing
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y texlive texlive-lang-european texlive-latex-extra make
RUN apt-get install -y texlive-pictures