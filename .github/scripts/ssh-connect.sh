#!/bin/bash

ssh $SSH_USER@$SSH_HOST
cd $WORK_DIR && git checkout $MAIN_BRANCH && git pull && exit
rm -rf ~/.ssh
