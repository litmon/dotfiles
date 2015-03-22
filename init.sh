#!/bin/sh

echo "===== brew installing ====="
if [ `which brew` ]; then
  echo "brew is already installed.\n"
else
  ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
fi

echo "===== ansible installing ====="
if [ `which ansible` ]; then
  echo "ansible is already installed.\n"
else
  brew install ansible
fi

echo "===== setup from ansible playbook. ====="
ansible-playbook ansible/localhost.yml
