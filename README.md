jem-docker
==========

Docker + IPython Notebook for [Just Enough Math](http://justenoughmath.com)

Lifecycle
---------

Provision:

Follow the steps to [launch Docker](https://docs.docker.com/installation/amazon/)
on an `m3.medium` EC2 node on AWS, then:

    sudo apt-get update
    sudo apt-get install lynx git emacs
    git clone https://github.com/ceteri/jem-docker.git


Build:

    sudo docker build --force-rm=true -t jem:latest .

Run:

    sudo docker run -d -p 8080:8080 jem:latest

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


---

This work is licensed under the Creative Commons
Attribution-NonCommercial-NoDerivatives 4.0 International License.
To view a copy of this license, visit
http://creativecommons.org/licenses/by-nc-nd/4.0/.
