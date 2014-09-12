#/bin/bash

#	Automatic Add/Commit/Push.
#	Hoon H., 2014/09/12
#
#	You should run this command at repository root.
#	Commit message is always required.
#
#		Tools/add-commit-push.bash <commit-message>
#





### global parameter capturings

USER_COMMIT_MSG="$1"






### common features.

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






#### subprograms

function assert_monolith_repository_root
{
	# Checkup exercise.
	cd .git
	cd ..
	cd Components
	cd ..
	cd Monolith
	cd ..
	cd Monolith.xcworkspace
	cd ..
}
function assert_non_empty_commit_message
{
	if [ "$USER_COMMIT_MSG" = "" ]
	then
		logerr "Please provide a commit message."
		logerr
		logerr "  Tools/add-commit-push.bash <commit-message>"
		logerr
		exit 1
	fi
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
		git commit -a --allow-empty-message -m "$USER_COMMIT_MSG"
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









#### main program - central control

set -e

assert_monolith_repository_root
assert_non_empty_commit_message

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

















