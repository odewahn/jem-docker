FROM ubuntu:latest
Maintainer Paco Nathan

# ..had to nix "glpk" since Ubuntu 14(trusty) does not have it available yet

RUN apt-get update; \
  DEBIAN_FRONTEND=noninteractive apt-get --no-install-recommends install --yes \
    git wget build-essential python-dev ipython ipython-notebook python-pip \
    libatlas-base-dev gfortran gcc-multilib python-glpk \
    python-numpy python-scipy python-matplotlib python-tk python-pandas python-sympy; \
  pip install scipy; \
  pip install neurolab; \
  pip install hyperloglog; \
  pip install pybloom; \
  pip install git+https://github.com/rafacarrascosa/countminsketch

ADD ./notebook/ /tmp/notebook/

EXPOSE 8080
ADD ./run.sh /run.sh
CMD /run.sh

