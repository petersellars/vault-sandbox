#!/bin/bash
vault() {
  docker run -it --rm -e VAULT_ADDR --entrypoint=/bin/sh cato1971/vault -c "vault auth $VAULT_TOKEN &>/dev/null; vault $*" 
}
