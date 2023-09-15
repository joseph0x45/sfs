#!/bin/bash

echo "You are running the tmx installation script. This script will install the tmx utility on your system"
echo "Take a look at what the script is doing by visiting the github repo at https://github.com/TheWisePigeon/tmx/install.sh"
if command -v git &> /dev/null; then
  git_version=$(git --version)
  echo "Found $git_version"
  echo "Cloning latest tmx from github ..."
  git clone https://github.com/TheWisePigeon/tmx /tmp/tmx 
  if [ $? -eq 1 ]; then
    echo "Failed to clone tmx from github"
    exit 1
  else
    echo "Done"
  fi
  echo "Adding executable permission to tmx"
  chmod u+x /tmp/tmx/tmx.sh
  if [ $? -eq 1 ]; then
    echo "Failed to add executable permission to tmx"
    echo "Cleaning up before aborting"
    rm -rf /tmp/tmx
    exit 1
  else
    echo "Done"
  fi
  echo "Moving tmx to /usr/local/bin/ (You may move it elsewhere after the installation as you wish)"
  sudo mv /tmp/tmx/tmx.sh /usr/local/bin/
  if [ $? -eq 1 ]; then
    echo "Failed to move tmx into /usr/local/bin"
    echo "Cleaning up before aborting"
    rm -rf /tmp/tmx
    exit 1
  else
    echo "Done"
  fi
  echo "Cleaning up..."
  rm -rf /tmp/tmx
  echo "tmx installed successfully!"
  echo "To function properly tmx needs xdotool to be installed. Make sure to have it installed. Now check https://github.com/TheWisePigeon/tmx#README to know more about tmx"
  exit 0
else
  echo "Git is not installed. Please install Git to proceed."
fi
