
FROM continuumio/anaconda

MAINTAINER Amir Szitenberg <amir@adssc.org>

RUN pip install reprophylo ete2 cloud dendropy
RUN conda install -c bioconda raxml
RUN apt-get -y install xvfb
RUN conda install -c r r-essentials
RUN conda install -c bioconda bioconductor-phyloseq
RUN conda create -n qiime1 python=2.7 qiime matplotlib=1.4.3 mock nose -c bioconda
