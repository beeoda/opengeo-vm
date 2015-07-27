#!/bin/bash
###
#
# Install script for Ubuntu Mate (14.04) (on distributed VBox VM)
# 
# History:
#   - 2015/06/06: created from history of 14.04LTS install 
#   - 2015/07/26: last update before workshop
###

set +e

# VIRTUALBOX
read -p "Add $USER to vbox group (y/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    sudo usermod -G vboxsf -a $USER
fi

echo "Updating existing software..."
sudo apt-get update
sudo apt-get upgrade
sudo apt-get dist-upgrade
sudo apt-get autoremove

sudo apt-get install git vim

# DOTFILES - NOPE

# SOURCES
echo "Adding PPAs..."
# UBUNTUGIS -- OBVIOUS -- OTB, QGIS 2.8, GDAL 1.11.2, GRASS GIS, ETC.
sudo add-apt-repository ppa:ubuntugis/ubuntugis-unstable  
# Dock / Planky
sudo add-apt-repository ppa:ricotz/docky
# ORACLE JAVA -- NO JRE8 ON 14.04 
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer
sudo update-java-alternatives -s java-8-oracle

# LOVELY TEXT EDITOR
sudo add-apt-repository ppa:webupd8team/atom
# ADV MANAGEMENT
sudo add-apt-repository ppa:webupd8team/y-ppa-manager

sudo apt-get update 

# REPO SOFTWARE
echo "Adding custom software..."
sudo apt-get install plank
sudo apt-get install atom 
sudo apt-get install y-ppa-manager
sudo apt-get install libgdal-dev 
sudo apt-get install qgis 
sudo apt-get install otb-bin otb-bin-qt
# sudo apt-get install monteverdi2 
# sudo apt-get install grass  # 2015-06-06: grass is 7.0.0; grass-dev is 6.4.3-3
sudo apt-get install pinta  # REPO? IS THIS NEW ENOUGH?
sudo apt-get install r-base  # ALSO NEED RSTUDIO
sudo apt-get install remmina  # VNC/RDP FOR NOT MUCH BLOAT
# TOOD -- NO VM IN YOUR VM, BUT DO I NEED `DKMS`
# sudo apt-get install virtualbox virtualbox-guest-utils virtualbox-guest-additions-iso
# LOVELY FEATURE
sudo apt-get install redshift-gtk

# RSTUDIO
sudo apt-get install libjpeg62
cd /tmp
wget http://download1.rstudio.org/rstudio-0.99.441-amd64.deb
sudo dpkg -i rstudio*deb
cd 

# GOOGLE
# PROBABLY -- OR TACK ON AS EXTRA INSTALL SCRIPT
sudo apt-get install libxss1 libappindicator1 libindicator7
cd /tmp
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome*.deb
cd

cd /tmp
wget http://dl.google.com/dl/earth/client/current/google-earth-stable_current_amd64.deb
sudo dpkg -i google-earth*.deb
sudo apt-get install -f
cd

# PYTHON / PIP
sudo apt-get install pyflakes pylint python-jedi pep8
sudo apt-get install ipython-qtconsole python-pip python-scipy python-numpy pkgconf libfreetype6-dev libpng12-dev

sudo pip install -U numexpr pandas scikit-learn statsmodels scikit-image matplotlib
sudo pip install -U click docopt rasterio fiona shapely snuggs progressbar2

# Tools for QGIS plugin building
sudo apt-get install pyqt4-dev-tools python-sphinx

# DROPBOX
# CAN INCLUDE AS AN INSTALL SCRIPT ON DESKTOP
# BETTER ADVICE: JUST MAP SHARED FOLDER
#
# sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E
# sudo add-apt-repository "deb http://linux.dropbox.com/ubuntu $(lsb_release -sc) main"
# sudo apt-get update && sudo apt-get install dropbox

# REPOS -- DECIDE -- SET ROOT PERMISSIONS TO REPOS?
read -p "Download repositories? (y/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
     
    if [ ! -d $HOME/Documents ]; then
        mkdir $HOME/Documents
    fi
    cd $HOME/Documents

    # BEEODA
    git clone --recursive https://github.com/beeoda/roi_plugin.git 
    git clone --recursive https://github.com/beeoda/scripts.git
    git clone --recursive https://github.com/beeoda/tutorials.git
    git clone --recursive https://github.com/beeoda/opengeo-vm.git    

    # CEHOLDEN
    git clone --recursive https://github.com/ceholden/open-geo-tutorial.git

    cd $HOME
fi
