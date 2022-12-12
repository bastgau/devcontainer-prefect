#!/bin/bash

RED="\e[31m"
GREEN="\e[32m"
ENDCOLOR="\e[0m"

echo -e "\n${GREEN}> Display pip info/version.${ENDCOLOR}\n"
pip --version

# ADD [here] your other verification todo.

echo -e "\n${GREEN}> Display SQLite info/version.${ENDCOLOR}\n"
sqlite3 -version

echo -e "\n${GREEN}> Display Prefect info/version.${ENDCOLOR}\n"
prefect version
