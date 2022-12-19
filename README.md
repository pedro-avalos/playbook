# playbook

This repository uses ansible to provision and maintain my Linux installations.

At the moment, my focus is on provisioning and maintining Fedora Linux machines
since that is what I currently use. The building blocks are there to add
support for any Linux machine (in fact, some of my roles, e.g. flatpak, already
work for any Linux machine).

## Provisioning

To set up the machine from scratch, use the `provision.yaml` playbook.

```sh
ansible-playbook -K provision.yaml
```

## Maintaining


### Full

To apply any updates to repositories, packages, and/or dotfiles/configuration,
use the `maintain.yaml` playbook.

```sh
ansible-playbook -K maintain.yaml
```

### Configuration Only

To only apply updates to dotfiles/configuration, use the
`configure.yaml` playbook.

```sh
ansible-playbook -K configure.yaml
```
