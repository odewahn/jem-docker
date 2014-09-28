docker-ipython-notebook
=======================

Docker + IPython Notebook for [Just Enough Math](http://justenoughmath.com)

Based on [dockernotebook](https://github.com/rissem/dockernotebook) project


Build:

    docker build -t jem:latest .

Run:

    sudo docker run -d -p 8080:8080 jem:latest
