#!/bin/bash

echo "You are running the tmx installation script. This script will install the tmx utility on your system"
echo "Take a look at what the script is doing by visiting the github repo at https://github.com/TheWisePigeon/tmx/install.sh"
echo "Do you wish to proceed? Y/n"
read -r response
if [[ "$response" == "y" || "$response" == "Y" || -z "$response" ]]; then
  if command -v git &> /dev/null; then
    git_version=$(git --version)
    echo "Found $git_version"
    echo "Creating temporary folder at /tmp/.tmx ..."
    mkdir /tmp/.tmx
    echo "Done!"
    echo "Cloning latest tmx from github ..."
    git clone https://github.com/TheWisePigeon/tmx /tmp/.tmx/tmx 
    echo "Done"
    echo "Moving tmx to /usr/local/bin/ (You may move it elsewhere after the installation as you wish)"
    mv /tmp/.tmx/tmx/tmx.sh /usr/local/bin/
    echo "Done"
    echo "Adding executable permission to tmx"
    chmod u+x /usr/local/bin/tmx.sh
    echo "Done"
    echo "Cleaning up..."
    rm -rf /tmp/.tmx
    echo "tmx installed successfully!"
    echo "To function properly tmx needs xdotool to be installed. Make sure to have it installed. Now check https://github.com/TheWisePigeon/tmx#README to know more about tmx"
    exit 0
  else
    echo "Git is not installed. Please install Git to proceed."
  fi
fi
echo "Installation aborted"
