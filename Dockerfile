
FROM continuumio/anaconda

MAINTAINER Amir Szitenberg <amir@adssc.org>

RUN pip install reprophylo ete2 cloud dendropy
RUN apt-get update
RUN apt-get -y install xvfb build-essential gfortran
RUN conda install -y -c r r-ape=3.2.0 r-plyr=1.8 \
  r-data.table=1.9.6 r-foreach=1.4.2 r-gtable \
  r-reshape2 r-scales=0.3.0 r-igraph r-rjsonio
RUN conda install -y -c bioconda bioconductor-phyloseq blast mafft exonerate raxml kraken-all mothur
RUN Rscript -e "install.packages('maps', repos='http://cran.us.r-project.org')" && \
  Rscript -e "install.packages('mvtnorm', repos='http://cran.us.r-project.org')" && \
  Rscript -e "install.packages('expm', repos='http://cran.us.r-project.org')" &&\
  Rscript -e "install.packages('phytools', repos='http://cran.us.r-project.org')" && \
  Rscript -e "install.packages('ouch', repos='http://cran.us.r-project.org')"
RUN conda create -y -n qiime1 python=2.7 qiime matplotlib=1.4.3 mock nose -c bioconda

# Todo: script for full kraken db, orthofinder
# script for jupyter notebook
