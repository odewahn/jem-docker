## check, already using Vagrant and VirtualBox
## let's get this running..

vagrant plugin install vagrant-omnibus
vagrant up
vagrant ssh

sudo bash
apt-get install python-pip python-dev build-essential 
apt-get install libatlas-base-dev gfortran
apt-get install gcc-multilib
apt-get install lynx emacs23-nox
apt-get install glpk
apt-get install python-glpk
pip install scipy
pip install neurolab
pip install hyperloglog
pip install countminsketch # or build from GitHub repo
pip install pybloom
pip install lshash # or build from PyPi tarball
exit

# download ZIP to ./

cp /vagrant/jem.zip
atlas2ipynb API_KEY ceteri/jem
cd jem
nbserver
http://localhost:8888

## check that all works great!
## now, let's package a box to put on the USB sticks

vagrant package
vagrant box add jem package.box virtualbox
vagrant box list

## running `vagrant box list` confirms the new box was added

vagrant halt
mkdir ../jem
mv package.box ../jem
cd ../jem
vagrant init

edit Vagrantfile
	config.vm.network :forwarded_port, guest: 8888, host: 8888


## on the student side:
## edit Vagrantfile to change the config line: config.vm.box = "jem"

vagrant box add jem package.box virtualbox
vagrant up
vagrant ssh
cd jemnbserverOpen a browser window at:http://localhost:8888