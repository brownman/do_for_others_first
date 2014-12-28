#https://github.com/brownman/install_config_test/blob/master/install/sources.sh

sudo apt-get install -y python-software-properties
sudo add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main universe restricted multiverse"
sudo  apt-get -y -qq update 
