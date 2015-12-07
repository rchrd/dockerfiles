# Ansible

Run Ansible from a Docker container.

Default usage:

```bash
docker run --rm -m 128m -v ${HOME}:${HOME} -w ${PWD} rchrd/ansible ansible <arguments>
```

Usage with ssh keys:

```bash
docker run --rm -m 128m -v ${HOME}:${HOME} -w ${PWD} -v ${HOME}/.ssh:/ssh:ro rchrd/ansible ansible <arguments>
```

## Alias

Using alias makes working with the Docker container as easy as normal Ansible calls

```bash
alias ansible="docker run -it --rm --rm -m 128m -v ${HOME}:${HOME} -w ${PWD} -v ${HOME}/.ssh:/ssh:ro rchrd/ansible ansible"
alias ansible-playbook="docker run -it --rm --rm -m 128m -v ${HOME}:${HOME} -w ${PWD} -v ${HOME}/.ssh:/ssh:ro rchrd/ansible ansible-playbook"
```
