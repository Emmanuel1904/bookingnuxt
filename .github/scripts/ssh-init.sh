#!/bin/bash

install -m 600 -D /dev/null ~/.ssh/id_rsa
echo "$SSH_PRIVATE_KEY" > ~/.ssh/id_rsa
ssh-keyscan -H $SSH_HOST > ~/.ssh/known_hosts
