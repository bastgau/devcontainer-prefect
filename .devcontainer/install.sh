#!/bin/bash

RED="\e[31m"
GREEN="\e[32m"
ENDCOLOR="\e[0m"

echo -e "\n${GREEN}> Configure environment.${ENDCOLOR}\n"

sudo chgrp vscode /workspaces/app/.venv
sudo chown vscode /workspaces/app/.venv

git config --global --add safe.directory /workspaces/app
git config core.eol lf
git config core.autocrlf false

python3 -m venv /workspaces/app/.venv
PATH="/workspaces/app/.venv/bin:$PATH"

echo -e "Done.\n"

echo -e "${GREEN}> Update .bashrc with new PREFECT_HOME.${ENDCOLOR}\n"
# export PREFECT_PROFILES_PATH=/workspaces/app/.prefect/profiles.toml
# echo "export PREFECT_PROFILES_PATH=$PREFECT_PROFILES_PATH" >> /home/vscode/.bashrc

export PREFECT_HOME=/workspaces/app/.prefect
echo "export PREFECT_HOME=$PREFECT_HOME" >> /home/vscode/.bashrc

echo -e "Done.\n"

echo -e "${GREEN}> Update pip tool and install dependencies.${ENDCOLOR}\n"

source /workspaces/app/.venv/bin/activate
pip install --upgrade pip

pip install -r /workspaces/app/requirements-dev.txt
pip install -r /workspaces/app/requirements.txt

/workspaces/app/.devcontainer/check-post-install.sh

echo -e ""
