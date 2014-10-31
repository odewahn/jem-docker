FROM ipython/scipystack
MAINTAINER Paco Nathan "http://liber118.com/pxn/"

ADD src/ /tmp
RUN /tmp/install.sh

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
  apt-get --no-install-recommends install -y libglpk-dev && \
  pip install glpk && \
  pip install neurolab && \
  pip install hyperloglog && \
  pip install pybloom && \
  pip install git+https://github.com/rafacarrascosa/countminsketch

RUN apt-get install -y libsm6 libxrender1 libfontconfig1 libXext6

EXPOSE 8888

WORKDIR /usr/src/notebook

CMD ipython2 notebook --ip=0.0.0.0 --no-browser