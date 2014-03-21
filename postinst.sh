#!/bin/bash
source /home/vagrant/.bashrc
echo "Installing ruby 1.8..."
rvm install ruby-1.8
cd /vagrant
echo "Clonning sample app..."
git clone https://github.com/railstutorial/sample_app.git
cd sample_app
/home/vagrant/.rvm/bin/rvm use 1.8
echo "Installing app..."
/home/vagrant/.rvm/gems/ruby-1.8.7-p374@global/bin/bundle install
echo "Setup project db..."
/home/vagrant/.rvm/gems/ruby-1.8.7-p374@global/bin/rake db:setup
