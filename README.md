jem-docker
==========

Docker + IPython Notebook for [Just Enough Math](http://justenoughmath.com)

See also [Docker registry](https://registry.hub.docker.com/u/ceteri/jem/)

Lifecycle
---------

Provision:

Follow the steps to [launch Docker](https://docs.docker.com/installation/amazon/)
on a EC2 node on AWS (at least an `m3.medium` with +16 GB storage) then:

    sudo apt-get update ; sudo apt-get install -y lynx git emacs
    git clone https://github.com/ceteri/jem-docker.git
    cd jem-docker

Build:

    sudo docker build --force-rm=true -t jem:latest .

Run:

    sudo docker run -d -p 8888:8888 jem:latest

Troubleshoot:

    sudo docker run -it jem:latest /bin/bash

Clean:

    sudo docker ps -a --no-trunc | grep 'Exit' | awk '{print $1}' | xargs -r sudo docker rm
    sudo docker images --no-trunc | grep none | awk '{print $3}' | xargs -r sudo docker rmi

Kudos
-----

This is based on:

  * [Docker Jumpstart](http://odewahn.github.io/docker-jumpstart/) by Andrew Odewahn @ O'Reilly Media
  * [ipython-docker](https://github.com/odewahn/ipython-docker) by Andrew Odewahn @ O'Reilly Media
  * [docker-anaconda](https://github.com/opentable/docker-anaconda) by Pablo Delgado @ OpenTable
  * [dockernotebook](https://github.com/rissem/dockernotebook) by Matt Klich, Mike Risse
  * [Clean Up After Docker](http://blog.stefanxo.com/2014/02/clean-up-after-docker/) by StefanXO
  * much appreciated advice+moral support from [@AlTobey](https://twitter.com/AlTobey)

---

This work is licensed under the Creative Commons
Attribution-NonCommercial-NoDerivatives 4.0 International License.
To view a copy of this license, visit
http://creativecommons.org/licenses/by-nc-nd/4.0/.
