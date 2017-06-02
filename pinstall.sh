#!/bin/bash


# options
echo "Did you configure the board (Y/N)?"
read isconfigured


if [$isconfigured = "N"]
	then
    sudo raspi-config
fi


# update
echo "---------------------------"
echo "--- Basic system update ---"
echo "---------------------------"
sudo apt-get --yes update
sudo apt-get --yes upgrade


# install apps
echo "--------------------"
echo "--- Install apps ---"
echo "--------------------"
apps_to_be_installed="
git
vim
mc
sqlite3
libsqlite3-dev
build-essential
nginx
python3
"
additional_apps="
libpq-dev
apache2
libapache2-mod-wsgi
postgresql
postgresql-contrib
nodejs
npm"
sudo apt-get install --yes $apps_to_be_installed
#sudo apt-get install --yes $additional_apps


## install python apps
echo "--- install python libs ---"
python_libs="
python-pip
python3-pip
python3-virtualenv
python-virtualenv
python-dev
python3-dev
"
sudo apt-get install --yes $python_libs


echo "--- pip and pip3 upgrade ---"
sudo pip install --upgrade pip
sudo pip3 install --upgrade pip
echo "--- install pip and pip3 packages ---"
sudo pip install flask virtualenv RPi.GPIO
sudo pip3 install django flask virtualenv RPi.GPIO gunicorn


# make folders
echo "---------------------------"
echo "--- Make folders update ---"
echo "---------------------------"
mkdir var/www


#reboot device
echo "--------------------------"
echo "--- System will reboot ---"
echo "--------------------------"
sudo shutdown -r +3
