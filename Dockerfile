
FROM continuumio/anaconda

MAINTAINER Amir Szitenberg <amir@adssc.org>

RUN pip install reprophylo ete2 cloud dendropy
RUN conda install raxml
RUN apt-get install xvfb
RUN Rscript -e "source('http://bioconductor.org/biocLite.R');biocLite('phyloseq')"
RUN conda create -n qiime1 python=2.7 qiime matplotlib=1.4.3 mock nose -c bioconda
