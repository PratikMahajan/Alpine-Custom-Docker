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

header_text "Installing Openshift and Kubernetes Commandline Tools"
cd /tmp
curl -l https://mirror.openshift.com/pub/openshift-v4/clients/ocp/latest/openshift-client-linux-4.1.4.tar.gz > /tmp/openshift-client-linux.tar.gz
tar -xzf /tmp/openshift-client-linux.tar.gz
mv /tmp/{kubectl,oc} /usr/local/bin
rm /tmp/openshift-client-linux.tar.gz

# Create user
adduser cloud
su - cloud

