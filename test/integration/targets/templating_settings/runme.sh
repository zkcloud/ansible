#!/usr/bin/env bash

set -eux

ansible-playbook test_templating_settings.yml -i ../../inventory -v "$@"
ansible-playbook warn_on_register.yml -i ../../inventory -v "$@" 2>&1| grep 'is not templatable, but we found'
[ "$(ansible-playbook dont_warn_register.yml -i ../../inventory -v "$@" 2>&1| grep -c 'is not templatable, but we found')" == "0" ]
