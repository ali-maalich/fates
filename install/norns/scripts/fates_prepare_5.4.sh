sudo raspi-config nonint do_spi 0
sudo raspi-config nonint do_i2c 0

sudo apt update -y
sudo apt-get dist-upgrade -y

sudo apt-get install git bc vim bison flex libssl-dev i2c-tools libncurses5-dev -y
sudo apt-get install raspberrypi-kernel-headers

cd /home/we

cd fates/install/norns/files/ssd1322

## compile the drivers    
make -C /lib/modules/$(uname -r )/build M=$(pwd) modules

## move the drivers    
sudo cp -v ~/linux/drivers/staging/fbtft/*.ko /lib/modules/$(uname -r)/kernel/drivers/staging/fbtft/

sudo depmod -a

sudo reboot