## ansible-testkitchen

https://kitchen.ci/

requirements:
- Ruby (http://rubyinstaller.org/)
- Virtualbox (https://www.virtualbox.org/), KVM, Docker
- Vagrant (http://www.vagrantup.com/downloads.html)

optional:
- make (https://www.gnu.org/software/make/)

## Setup:
- gem install bundler
- bundle install

## Usage:

You can use the Makefile or kitchen directly to manage your test environment.
Issue the kitchen command without any parameters to see the available tasks.

When using kitchen directly you have to specify the kitchen.yml file to use, then issue a kitchen command.

Example:
```
KITCHEN_YAML="kitchen.openstack.yml" kitchen test
```
When using make there are some required and optional parameters:
- driver: selects the yaml file for the driver (required)
- task: the kitchen task to execute (required)
- node: limits execution to this node as defined in the suites section in the kitchen.yaml (optional)
Example:
```
make kitchen driver=docker task=test node="nodename"
```
