FROM phusion/baseimage:latest
MAINTAINER Paco Nathan "http://liber118.com/pxn/"

ADD src/ /tmp
RUN /tmp/install.sh

ENV PATH /root/anaconda/bin:$PATH 
ENV LD_LIBRARY_PATH /usr/local/lib:$LD_LIBRARY_PATH

CMD ["/sbin/my_init" , "--","bash", "-l"]

RUN apt-get update; \
  DEBIAN_FRONTEND=noninteractive apt-get --no-install-recommends install --yes \
  git libglpk-dev; \
  conda update conda; \
  conda update ipython; \
  conda update matplotlib; \
  pip install glpk; \
  pip install neurolab; \
  pip install hyperloglog; \
  pip install pybloom; \
  pip install git+https://github.com/rafacarrascosa/countminsketch

RUN apt-get install -y libsm6 libxrender1 libfontconfig1 libXext6

EXPOSE 8888

RUN useradd -m -s /bin/bash atlas

RUN mkdir -p /home/atlas
ADD notebook/ /home/atlas 
WORKDIR /home/atlas
RUN chown -R atlas:atlas /home/atlas

USER atlas
ENV HOME /home/atlas
ENV SHELL /bin/bash
ENV USER atlas

RUN find . -name '*.ipynb' -exec ipython trust {} \;

