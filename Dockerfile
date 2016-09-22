
FROM continuumio/anaconda

MAINTAINER Amir Szitenberg <amir@adssc.org>

RUN pip install reprophylo ete2 cloud dendropy
RUN apt-get update
RUN apt-get -y install xvfb build-essential gfortran wget gzip
RUN conda install -y -c r r-ape=3.2.0 r-plyr=1.8 \
  r-data.table=1.9.6 r-foreach=1.4.2 r-gtable \
  r-reshape2 r-scales=0.3.0 r-igraph r-rjsonio
RUN conda install -y -c bioconda bioconductor-phyloseq \
  blast mafft exonerate raxml kraken-all mothur \
  biopython=1.68 seaborn fasttree vsearch trimmomatic \
  fastx_toolkit=0.0.14 flash hmmer
RUN Rscript -e "install.packages('maps', repos='http://cran.us.r-project.org')" && \
  Rscript -e "install.packages('mvtnorm', repos='http://cran.us.r-project.org')" && \
  Rscript -e "install.packages('expm', repos='http://cran.us.r-project.org')" &&\
  Rscript -e "install.packages('phytools', repos='http://cran.us.r-project.org')" && \
  Rscript -e "install.packages('ouch', repos='http://cran.us.r-project.org')"
RUN conda create -y -n qiime1 python=2.7 qiime matplotlib=1.4.3 mock nose -c bioconda
RUN wget \
  https://github.com/matsen/pplacer/releases/download/v1.1.alpha18/pplacer-linux-v1.1.alpha18-2-gcb55169.zip && \
  gzip -d pplacer-linux-v1.1.alpha18-2-gcb55169.zip && \
  rm pplacer-linux-v1.1.alpha18-2-gcb55169.zip&& \
  mv pplacer-linux-v1.1.alpha18-2-gcb55169 /usr/bin/. && \
  chmod a+x /usr/bin/pplacer-linux-v1.1.alpha18-2-gcb55169/* && \
  ln -s /usr/bin/pplacer-linux-v1.1.alpha18-2-gcb55169/* /usr/bin/. && \
  chmod a+x /usr/bin/pplacer-linux-v1.1.alpha18-2-gcb55169/scripts/* && \
  ln -s /usr/bin/pplacer-linux-v1.1.alpha18-2-gcb55169/scripts/* /usr/bin/. && \
  wget http://meta.microbesonline.org/fasttree/FastTreeMP && \
  chmod a+x FastTreeMP && \
  mv FastTreeMP /usr/bin/. && \
  wget https://github.com/HullUni-bioinformatics/metaBEAT/archive/master.zip && \
  gzip -d metaBEAT-master.zip && \
  rm  metaBEAT-master.zip && \
  chmod a+x metaBEAT-master/Docker/scripts/. && \
  chmod a+x metaBEAT-master/Docker/external_software/process_shortreads && \
  mv metaBEAT-master/Docker/scripts/* /usr/bin/. && \
  mv metaBEAT-master/Docker/external_software/process_shortreads /usr/bin/. && \
  rm -r metaBEAT-master
  
  
