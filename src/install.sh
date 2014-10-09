export DEBIAN_FRONTEND=noninteractive 
apt-get update
apt-get upgrade -y
apt-get install -y aria2 make libatlas-base-dev gfortran gcc-multilib
apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# install GLPK
# http://en.wikibooks.org/wiki/GLPK/Linux_OS
mkdir ~/glpk
cd ~/glpk
aria2c -s 16 -x 16 -k 30M ftp://ftp.gnu.org/gnu/glpk/glpk-4.47.tar.gz -o glpk-4.47.tar.gz
tar -xzvf glpk-4.47.tar.gz
cd glpk-4.47
./configure
make check
make install
make clean
rm -rf ../glpk-4.47.tar.gz
