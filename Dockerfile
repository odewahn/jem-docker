FROM phusion/baseimage:latest
Maintainer Paco Nathan

ADD src/ /tmp
RUN /tmp/install.sh

ENV PATH /root/anaconda/bin:$PATH 

CMD ["/sbin/my_init" , "--","bash", "-l"]

# unfortunately, skip apt-get for (gplk, python-glpk) since "trusty" lacks it

RUN apt-get update; \
  DEBIAN_FRONTEND=noninteractive apt-get --no-install-recommends install --yes \
    git libatlas-base-dev gfortran gcc-multilib; \
  conda update conda; \
  conda update ipython; \
  conda update matplotlib; \
  pip install neurolab; \
  pip install hyperloglog; \
  pip install pybloom; \
  pip install git+https://github.com/rafacarrascosa/countminsketch

ENV LD_LIBRARY_PATH /usr/local/lib:$LD_LIBRARY_PATH

EXPOSE 8080

ADD notebook/ /tmp/notebook/
ADD src/run.sh /run.sh
CMD /run.sh
