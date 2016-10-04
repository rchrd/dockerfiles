# Ansible

Run Ansible from a Docker container.

Default usage:

```bash
docker run --rm -m 128m -v ${PWD}:${PWD}:ro -w ${PWD} rchrd/ansible ansible <arguments>
```

Usage with ssh keys:

```bash
docker run --rm -m 128m -v ${PWD}:${PWD}:ro -w ${PWD} -v ${HOME}/.ssh:/ssh:ro rchrd/ansible ansible <arguments>
```

## Alias

Using funtions makes working with the Docker container as easy as normal Ansible calls (it contains some environment variables specific for my use case)

```bash
ansible() {
  docker run --rm -it \
      -e TF_STATE \
      -e TERRAFORM_STATE_ROOT \
      -v ${PWD}:${PWD}:ro \
      -w ${PWD} \
      --name ansible \
      rchrd/ansible ansible "$@"
}

ansible-playbook() {
  docker run --rm -it \
      -e TF_STATE \
      -e TERRAFORM_STATE_ROOT \
      -v ${PWD}/roles:/etc/ansible/roles \
      -v ${PWD}:${PWD}:ro \
      -w ${PWD} \
      --name ansible-playbook \
      rchrd/ansible ansible-playbook "$@"
}
```
