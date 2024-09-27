#! /bin/bash

# Script that will run after booting an Azure topology from Snapshot
# Script shall deploy the flags and prepare the VM per user

# Trap any error (any command exits with non-zero status)
trap 'catch' ERR

catch() {
  # Error handling code
  echo "An error occurred"
  exit 1
}

echo "Starting with post installation script"

### Retrieval of multiflags and credentials path
multiflags=/dpl_tmp/multiflags.txt
credentials=/dpl_tmp/credentials.txt


### EXAMPLE: Flag/Credential handling 
##Flag by index
#EXAMPLE: Index 0
awk -F"[{}]" '{print $2}' $multiflags | sed -n 's/.*"flag":"\([^"]*\)".*/\1/p'
#EXAMPLE: Index 1
awk -F"[{}]" '{print $4}' $multiflags | sed -n 's/.*"flag":"\([^"]*\)".*/\1/p'

##Flag by name
#EXAMPLE: flag name 1
grep -o '{[^{}]*"name":"flag name 1"[^{}]*}' $multiflags | sed -n 's/.*"flag":"\([^"]*\)".*/\1/p'

#EXAMPLE: flag-2
grep -o '{[^{}]*"name":"flag name 2"[^{}]*}' $multiflags | sed -n 's/.*"flag":"\([^"]*\)".*/\1/p'


###CUSTOM INSTALL LOGIC ###

### CLEANUP Files
rm -rf /dpl_tmp

### Cleanup Artifacts
## Clear history
history -c


echo "Finished post installation script"