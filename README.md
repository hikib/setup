# Setup

## Containers
Using podman to run separate containers on Windows machine.
See my [.ps1 scripts](https://github.com/hikmet-kibar/scripts) as
reference for how to run the containers.

## Ansible

_WILL BE REMOVED_ because I switched to a container setup (see
[containers](containers)

Ansible to set up working environments

```bash
$ ansible-playbook ./playbooks/all.yml -i ./playbooks/hosts --ask-become-pass
# OR
$ ansible-playbook ./playbooks/all.yml --tags "dev_tag" -i ./playbooks/hosts --ask-become-pass
```
