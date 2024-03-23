#!/bin/bash

repro_git="https://github.com/Emmanuel1904/bookingnuxt.git"

# Vérifie si les variables d'environnement nécessaires sont définies
if [ -z "$SSH_USER" ] || [ -z "$SSH_HOST" ] || [ -z "$WORK_DIR" ] || [ -z "$MAIN_BRANCH" ]; then
    echo "Certaines variables d'environnement ne sont pas définies."
    exit 1
fi

# check if current folder if empty: "$(ls -A .)" before git pull || git clone form origin
ssh $SSH_USER@$SSH_HOST "cd $WORK_DIR && git checkout $MAIN_BRANCH && 
if [ \"\$(ls -A .)\" ]; then 
    git pull --strategy-option theirs
else
    git remote add origin $repro_git &&
    git clone $repro_git .
fi &&
docker run -dp 3007:3000 \
    -w \"/$WORK_DIR\" --net=nginx_network --name dockerbookingcont_ --mount type=bind,src=\"./\",target=/$WORK_DIR \
    node:18-alpine \
    sh -c \"npm install && npm run dev\" &&
exit"

rm -rf ~/.ssh
# docker compose up -d --remove-orphans
