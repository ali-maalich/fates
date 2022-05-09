#!/bin/sh
echo Adding Monome apt repository...
curl https://keybase.io/artfwo/pgp_keys.asc | sudo apt-key add -
echo "deb https://package.monome.org/ stretch main" | sudo tee /etc/apt/sources.list.d/norns.list

echo Importing Blokas GPG public key...
curl -s https://blokas.io/blokas-archive-keyring.gpg | sudo dd status=none of=/usr/share/keyrings/blokas-archive-keyring.gpg
echo Adding Blokas APT repository...
echo "deb [signed-by=/usr/share/keyrings/blokas-archive-keyring.gpg] http://blokas.io/apt/ rpi main" | sudo dd status=none of=/etc/apt/sources.list.d/blokas.list
echo Updating package list...
sudo apt-get update

echo Importing GPG public key for serialosc...
gpg --keyserver keyserver.ubuntu.com --recv DD9300F1
gpg --export --armor DD9300F1 | sudo apt-key add -
echo "deb http://ppa.launchpad.net/artfwo/monome/ubuntu bionic main" | sudo tee /etc/apt/sources.list.d/monome.list

echo Updating package list...
sudo apt-get --allow-releaseinfo-change update

wget http://launchpadlibrarian.net/354246227/libreadline7_7.0-3_armhf.deb
sudo apt install ./libreadline7_7.0-3_armhf.deb
sudo apt update -y

sudo apt install --no-install-recommends jackd2 -y
sudo apt-get install libboost-dev -y
sudo apt-get install libjack-jackd2-dev -y
sudo apt install libmonome-dev -y
sudo apt install supercollider-common=1:3.9.10-0norns1 supercollider-language=1:3.9.10-0norns1 supercollider-server=1:3.9.10-0norns1 supercollider-supernova=1:3.9.10-0norns1 supercollider-dev=1:3.9.10-0norns1 -y
sudo apt install libnanomsg-dev liblua5.3-dev libudev-dev libevdev-dev liblo-dev libcairo2-dev liblua5.3-dev libavahi-compat-libdnssd-dev libasound2-dev -y
sudo apt install dnsmasq -y
sudo apt install sc3-plugins ladspalist -y
sudo apt install usbmount -y
sudo apt-get install alsa-utils -y
sudo apt-get install libi2c-dev -y
sudo apt-get install amidiauto -y
sudo apt install serialosc -y

sudo cp -f /home/we/fates/install/norns/files/interfaces /etc/network
sudo cp -f /home/we/fates/install/norns/files/systemd-udevd.service /lib/systemd/system/

sudo reboot
