#!/bin/bash

echo "Setting bash path to current directory"
cd "`dirname "$0"`"

vagrant up app
#vagrant provision app
vagrant ssh app
