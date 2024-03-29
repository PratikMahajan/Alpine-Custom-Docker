#!/bin/bash

### Styling for output ###
# Turn colors in this script off by setting the NO_COLOR variable in your
# environment to any value:

NO_COLOR=${NO_COLOR:-""}
if [ -z "$NO_COLOR" ]; then
  header=$'\e[1;33m'
  reset=$'\e[0m'
else
  header=''
  reset=''
fi

function header_text {
  echo "$header$*$reset"
}
###


header_text  "Installing Git"
apk add git

header_text "Installing Bash"
apk add bash 

header_text "Installing wget and bind-utils"
apk add wget bind-tools

header_text "Install Curl"
apk add curl 
