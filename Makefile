.PHONY:
.DEFAULT_GOAL := help
SHELL := /bin/bash

##@ Tasks
kitchen: ## kitchen driver="driver" task="task" node="node" (optional)
	@if [ -z "$(driver)" \
			-o -z "$(task)" \
		] ; then \
		echo 'Missing one or more required parameter(s).';\
		echo 'Use: make $@ driver="driver" task="task"'; \
		exit 1; \
	fi
	@KITCHEN_YAML="kitchen.${driver}.yml" kitchen ${task} ${node}

##@ Helpers
cloc:	## Show Lines of Code analysis
	@cloc --vcs git --quiet

help:	## Display this help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)
