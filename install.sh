#!/usr/bin/env bash

function exec() {
	if $verbose; then
		echo $@
	fi
	$@
}

function sudoexec() {
	if $verbose; then
		echo Executing $@ as sudo...
	fi
	sudo $@
}

function have_command() {
	echo -n Checking if you have command:\ 
	if command -v $1; then
		return 0
	else
		return 1
	fi
}