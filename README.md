# playbook

This repository uses ansible to provision and maintain my Linux installations.

## Provisioning

To set up the machine from scratch, use the `provision.yaml` playbook.

```bash
$ ansible-playbook -K provision.yaml
```

## Maintaining


### Full

To apply any updates to repositories, packages, and/or dotfiles/configuration,
use the `maintain.yaml` playbook.

```bash
$ ansible-playbook -K maintain.yaml
```

### Configuration Only

To only apply updates to dotfiles/configuration, use the
`configure.yaml` playbook.

```bash
$ ansible-playbook -K configure.yaml
```
