## ansible-testkitchen

https://kitchen.ci/

requirements:
- Ruby (http://rubyinstaller.org/)
- Virtualbox (https://www.virtualbox.org/), KVM, Docker
- Vagrant (http://www.vagrantup.com/downloads.html)

## Setup:
gem install bundler
bundle install

## Using testkitchen:

specify the kitchen.yml file to use, then issue a kitchen command
example:
KITCHEN_YAML="kitchen.openstack.yml" kitchen test
