# Setup For New Machines

Ansible to set up working environments

```bash
$ ansible-playbook ./playbooks/all.yml -i ./playbooks/hosts --ask-become-pass
# OR
$ ansible-playbook ./playbooks/all.yml --tags "dev_tag" -i ./playbooks/hosts --ask-become-pass
```
