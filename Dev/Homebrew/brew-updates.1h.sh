#!/bin/bash

# <bitbar.title>Homebrew Updates</bitbar.title>
# <bitbar.author>killercup</bitbar.author>
# <bitbar.author.github>killercup</bitbar.author.github>
# <bitbar.desc>List available updates from Homebrew (OS X)</bitbar.desc>

# really should have error checking and retry if locked out by another brew update
exit_with_error() {
  echo "err | color=red";
  exit 1;
}

/usr/local/bin/brew update &> /dev/null || exit_with_error;

UPDATES=$(/usr/local/bin/brew outdated --verbose);

UPDATE_COUNT=$(echo "$UPDATES" | grep -c '[^[:space:]]');

echo "↑$UPDATE_COUNT | dropdown=false"
echo "---";
if [ -n "$UPDATES" ]; then
  echo "Upgrade all | bash=/usr/local/bin/brew param1=upgrade terminal=true refresh="
  echo "$UPDATES" | awk '{print $0 " | bash=/usr/local/bin/brew param1=upgrade param2=" $1 " terminal=true refresh="}'
fi
echo "---";
echo "Brew Update | bash=brew param1=update terminal=true refresh="
#echo "Brew Upgrade | bash=brew param1=upgrade terminal=true refresh="
echo "Brew Cleanup | bash=brew param1=cleanup terminal=true refresh="
echo "Refresh | refresh="
