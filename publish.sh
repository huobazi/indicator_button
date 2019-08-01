#!/bin/bash

echo -e "\033[0;32m Publishing...\033[0m"
echo -e "\033[0;32m Please connect to your proxy first...\033[0m"

curl cip.cc

export OLD_PUB_HOSTED_URL=$PUB_HOSTED_URL
export OLD_FLUTTER_STORAGE_BASE_URL=$FLUTTER_STORAGE_BASE_URL

unset PUB_HOSTED_URL
unset FLUTTER_STORAGE_BASE_URL

flutter packages pub publish

export PUB_HOSTED_URL=$OLD_PUB_HOSTED_URL
export FLUTTER_STORAGE_BASE_URL=$OLD_FLUTTER_STORAGE_BASE_URL
