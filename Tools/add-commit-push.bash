#/bin/bash

set -e


function log
{
	echo "$@";
}
function logok
{
	log "[OK]" "$@";
}
function logerr
{
	echo "[ERR]" "$@" 1>&2;
}

function assert_master_branch
{
	logok "Current location:" `pwd`
	BR=`git branch --list "master"`
	if [ "$BR" = "* master" ]
	then
		logok "Here is a master branch."
	else
		logerr "Current branch is not set to 'master'."
		exit 1
	fi
}

function process_if_possible
{
	S1=`git status --short | wc -l`

	if (( $S1 > 0 ))
	then
		logok "Something to commit. Do it."
		git add . -A
		git commit -a --allow-empty-message -m ""
		git push
	else
		logok "Nothing to commit. Skipping"
	fi
}
function test_and_perform
{
	BACK=`pwd`
	cd $1
	assert_master_branch

	git status --short
	process_if_possible
	cd "$BACK"
	log
}

# Checkup exercise.
cd Monolith
cd ..

log
logok "Starting..."
log

test_and_perform Components/Common
test_and_perform Components/CommonMark
test_and_perform Components/SQLite3
test_and_perform Components/XML
test_and_perform .

logok "Done."
log

















