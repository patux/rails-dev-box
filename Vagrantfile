# -*- mode: ruby -*-
# vi: set ft=ruby :


$install_railsapp = <<INSTALL_RAILS_APP
source /home/vagrant/.bashrc
#echo "Installing ruby 1.8..."
#/home/vagrant/.rvm/bin/rvm install ruby-1.8
/home/vagrant/.rvm/bin/rvm use 1.8
echo "Installing rails..."
/home/vagrant/.rvm/rubies/ruby-1.8.7-p374/bin/gem install rails
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
INSTALL_RAILS_APP
Vagrant.configure('2') do |config|
  config.vm.box      = 'precise32'
  config.vm.box_url  = 'http://files.vagrantup.com/precise32.box'
  config.vm.hostname = 'rails-dev-box'

  config.vm.network :private_network, ip: "10.10.10.10"

  config.vm.provider 'vmware_fusion' do |v, override|
    override.vm.box     = 'precise64'
    override.vm.box_url = 'http://files.vagrantup.com/precise64_vmware.box'
  end

  config.vm.network :forwarded_port, guest: 3000, host: 3000

  #config.vm.provision :puppet do |puppet|
  #  puppet.manifests_path = 'puppet/manifests'
  #  puppet.module_path    = 'puppet/modules'
  #end
  config.vm.provision :shell, :inline => $install_railsapp
end
