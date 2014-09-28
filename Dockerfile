FROM ubuntu:latest
Maintainer Paco Nathan

# Build: docker build -t jem:latest .
# Run:   docker run -d -P jem:latest

RUN apt-get update; \
  DEBIAN_FRONTEND=noninteractive apt-get --no-install-recommends install --yes \
    git wget build-essential python-dev ipython ipython-notebook python-pip \
    libatlas-base-dev gfortran gcc-multilib glpk python-glpk \
    python-numpy python-scipy python-matplotlib python-pandas python-sympy; \
  pip install scipy; \
  pip install neurolab; \
  pip install hyperloglog; \
  pip install pybloom; \

#  pip install countminsketch # or build from GitHub repo

ADD ./notebook/ /tmp/notebook/

EXPOSE 8080
ADD ./run.sh /run.sh
CMD /run.sh

