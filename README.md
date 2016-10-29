# Vault Sandbox

## Verified version of Hashicorp Vault`
The [Vault][1] version added to the [Docker][2] container is verified according
to the steps found on the [Hashicorp Security](https://www.hashicorp.com/security.html)
page. An [Ansible][3] playbook is used to verify the [Vault][1] download prior
to its use in the [Docker][2] container.

```ansible-playbook -i "localhost," -c local vault.yml``` 

## Build the Hashicorp Vault Docker container
```docker build --rm -t cato1971/vault .```

### Running the container
```docker run -d -p 8200:8200 --hostname vault --name vault cato1971/vault```

### Using the container
To run the container we need to export the vault ipaddress. Using ```docker inspect -f '{{ .NetworkSettings.IPAddress }}' vault```
will provide the vault container ip address

```export VAULT_ADDR='http://X.X.X.X:8200'```

Run ```docker logs vault``` to obtain your vault root token and then export it too:

```export VAULT_TOKEN=PASTE_YOUR_TOKEN_HERE```

Then to run the container you can use the following command as an example:

```
docker run -it --rm -e VAULT_ADDR --entrypoint=/bin/sh cato1971/vault \
  -c "vault auth $VAULT_TOKEN; vault write secret/hello value=world"
``` 

#### Using a Bash Wrapper Script to run the container
Copy the [vault.sh](./vault.sh) file to sources in your ```.bashrc``` file using the following command:

```source /path/to/vault.sh```

### TO-DO
* Create Docker Container containing the verified binary implementaion of [Vault][1]
* Create GPG module for importing and verifying using keys
* Create SHA256 module for verifying binaries with signed SHA256SUMS 

[1]: https://vaultproject.io
[2]: https://www.docker.com
[3]: https://www.ansible.com
