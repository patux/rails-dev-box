#!/bin/bash
source /home/vagrant/.bashrc
echo "Installing ruby 1.8..."
rvm install ruby-1.8
rvm use 1.8
echo "Installing rails..."
gem install rails
cd /vagrant
echo "Clonning sample app..."
git clone https://github.com/railstutorial/sample_app.git
cd sample_app
echo "Installing app..."
bundle install
echo "Setup project db..."
rake db:setup
echo "Launching rail server..."
sudo apt-get install screen
nohup screen rails server

