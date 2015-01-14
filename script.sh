echo "SETUP: Adding Jenkins Package Address"
wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
echo "SETUP: Updating APT-GET"
sudo apt-get update
echo "SETUP: Installing pre-reqs"
sudo apt-get install firefox git nodejs jenkins python-pip phantomjs
echo "SETUP: Installing Robot Stuffs"
sudo pip install Robot-AppEyes simplejson requests

echo "SETUP: Downloading Sauce Connect and Extracting"
sudo rm -r ~/Downloads
sudo wget -N https://saucelabs.com/downloads/sc-4.3.6-linux.tar.gz -P ~/Downloads
sudo tar zxvf ~/Downloads/sc-4.3.6-linux.tar.gz -C ~/Downloads
sudo rm ~/Downloads/sc-4.3.6-linux.tar.gz

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
