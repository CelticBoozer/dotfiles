#!/bin/bash

# List .pacnew files when found
pacnews="$(pacdiff --output)"
nb="$(pacdiff --output | grep -c .)"
if [[ $nb -gt 0 ]]; then
  echo -e "\e[31m$nb .pacnew files found in system...\e[0m"
  printf "%s\n" "$pacnews"
else
  echo -e "\e[32mNo .pacnew files found in system...\e[0m"
fi
