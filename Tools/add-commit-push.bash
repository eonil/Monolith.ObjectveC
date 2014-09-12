#/bin/bash

set -e

cd Components
cd Common

BR=`git branch --list "master"`
if [ "$BR" = "* master" ]
then
	echo "OK!"
else
	echo "Current branch is not set to 'master'."
	exit 1
fi