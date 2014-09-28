sudo apt-get update
sudo apt-get install lynx git emacs openjdk-7-jdk

# wget anaconda
# http://continuum.io/downloads#all
wget http://09c8d0b2229f813c1b93-c95ac804525aac4b6dba79b00b39d1d3.r79.cf1.rackcdn.com/Anaconda-2.0.1-Linux-x86_64.sh
bash Anaconda-2.0.1-Linux-x86_64.sh

sudo /home/ubuntu/anaconda/bin/conda update conda
sudo /home/ubuntu/anaconda/bin/conda update ipython

# https://docs.docker.com/installation/ubuntulinux/
sudo apt-get update
sudo apt-get install docker.io
sudo ln -sf /usr/bin/docker.io /usr/local/bin/docker
sudo sed -i '$acomplete -F _docker docker' /etc/bash_completion.d/docker.io

sudo apt-get update
sudo apt-get install apt-transport-https

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9

sudo sh -c "echo deb https://get.docker.io/ubuntu docker main\
> /etc/apt/sources.list.d/docker.list"

sudo apt-get update
sudo apt-get install lxc-docker


# cd into git repo
sudo docker build -t foo .

sudo docker run -name foo3 -i -p 8080:8080 -t foo

