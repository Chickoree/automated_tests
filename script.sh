########        Notes:  ########################################################
#       Redirecting output from console to logs folder.                        #
#       Standard Output, STDOUT or 1 or blank, is redirected to /dev/null      #
#       where it is discarded.                                                 #
#       Standard Error, STDERR or 2, is redirected to the relevant log file    #
#                                                                              #
#       /dev/null 2>>/home/vagrant/logs/command-name.log                       #
#                                                                              #
################################################################################

echo "SETUP: Creating Logging directory"
sudo mkdir /home/vagrant/logs/ 1>/dev/null 2>/dev/null
echo "SETUP: Adding Jenkins Package Address"
wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add - 1>/dev/null 2>/home/vagrant/logs/wget.log
sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
echo "SETUP: Updating APT-GET"
sudo apt-get update 1>/dev/null 2>/home/vagrant/logs/apt-get.log
sudo apt-get check 1>/dev/null 2>>/home/vagrant/logs/apt-get.log
echo "SETUP: Installing pre-reqs"
sudo apt-get --assume-yes --verbose-versions install firefox git nodejs jenkins python-pip phantomjs 1>/dev/null 2>>/home/vagrant/logs/apt-get.log
sudo apt-get autoclean 1>/dev/null 2>>/home/vagrant/logs/apt-get.log
echo "SETUP: Installing Robot Stuffs"
sudo pip install Robot-AppEyes simplejson requests 1>/dev/null 2>>/home/vagrant/logs/app-eyes.log
echo "SETUP: Downloading Sauce Connect and Extracting"
sudo rm -rf /home/vagrant/Downloads/
sudo wget -N https://saucelabs.com/downloads/sc-4.3.6-linux.tar.gz -P /home/vagrant/Downloads 1>/dev/null 2>>/home/vagrant/logs/wget.log
sudo tar zxvf /home/vagrant/Downloads/sc-4.3.6-linux.tar.gz -C /home/vagrant/Downloads  1>/dev/null 2>/home/vagrant/logs/tar.log
sudo rm /home/vagrant/Downloads/sc-4.3.6-linux.tar.gz
echo "COMPLETED PROVISIONING"

#~/Downloads/sc-4.3.6-linux/bin/sc -u Chickoree -k d61c8e10-8463-43a7-8f87-c096dd42ade7 &


#echo "SETUP: Installing Chrome Drivers"
# Install unzip
#sudo apt-get install unzip

# Download latest version from official website and upzip it (here for instance, to ~/Downloads)
#wget -N http://chromedriver.storage.googleapis.com/2.9/chromedriver_linux64.zip -P ~/Downloads
#unzip ~/Downloads/chromedriver_linux64.zip -d ~/Downloads

# Make it executable and move to /usr/local/share
#chmod +x ~/Downloads/chromedriver
#sudo mv -f ~/Downloads/chromedriver /usr/local/share/chromedriver

# Create symbolic links
#sudo ln -s /usr/local/share/chromedriver /usr/local/bin/chromedriver
#sudo ln -s /usr/local/share/chromedriver /usr/bin/chromedriver
