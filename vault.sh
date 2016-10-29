#!/bin/bash
vault() {
  docker run -it --rm -e VAULT_ADDR --entrypoint=/bin/sh cato1971/vault -c "vault auth $VAULT_TOKEN &>/dev/null; vault $*" 
}

vault-github() {
  docker run -it --rm -e VAULT_ADDR --entrypoint=/bin/sh cato1971/vault -c "vault auth -method=github token=$GITHUB_ORG_TOKEN &>/dev/null; vault $*"
}
